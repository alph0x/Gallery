//
//  HomeInteractorTests.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

@testable import Gallery
import XCTest

class HomeInteractorTests: XCTestCase {
    // MARK: Subject under test

    var sut: HomeInteractor!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupHomeInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupHomeInteractor() {
        sut = HomeInteractor(presenter: HomePresenterSpy(),
                             manager: HomeServiceManagerSpy())
    }

    // MARK: Test doubles

    class HomePresenterSpy: HomePresentable {
        var presentFetchedImagesCalled = false
        var presentErrorCalled = false

        func presentFetchedImages(_ images: [Gallery.ImageMetadata]) {
            presentFetchedImagesCalled = true
        }

        func presentError(_ error: Error) {
            presentErrorCalled = true
        }
    }

    class HomeServiceManagerSpy: HomeServiceManageable {
        var fetchImagesCalled = false

        func fetchImages(onCompletion: ((Result<[Gallery.ImageMetadata], Error>) -> Void)?) {
            onCompletion?(.success([]))
            fetchImagesCalled = true
        }
    }

    class HomeServiceManagerErrorSpy: HomeServiceManageable {
        var fetchImagesCalled = false

        func fetchImages(onCompletion: ((Result<[ImageMetadata], Error>) -> Void)?) {
            onCompletion?(.failure(TestError.mock))
            fetchImagesCalled = true
        }
    }

    // MARK: Tests

    func testPresentFetchedImages() {
        // Given
        let spy = sut.presenter as! HomePresenterSpy

        // When
        sut.fetchImages()

        // Then
        XCTAssertTrue(spy.presentFetchedImagesCalled, "presentFetchedImages(_ images: [Gallery.ImageMetadata]) should ask the presenter to display the images")
    }

    func testPresentError() {
        // Given
        let spy = sut.presenter as! HomePresenterSpy
        sut.manager = HomeServiceManagerErrorSpy()

        // When
        sut.fetchImages()

        // Then
        XCTAssertTrue(spy.presentErrorCalled, "presentError(_ error: Error) should ask the presenter to display the error")
    }
}

private enum TestError: Error {
    case mock
}
