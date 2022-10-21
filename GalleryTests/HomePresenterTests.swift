//
//  HomePresenterTests.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

@testable import Gallery
import XCTest

class HomePresenterTests: XCTestCase {
    // MARK: Subject under test

    var sut: HomePresenter!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupHomePresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupHomePresenter()  {
        sut = HomePresenter(viewController: HomeViewControllerSpy())
    }

    // MARK: Test doubles

    class HomeViewControllerSpy: HomeDisplayable {
        var displayFetchedImagesCalled = false
        var displayErrorCalled = false

        func displayFetchedImages(_ images: [Gallery.ImageMetadata]) {
            displayFetchedImagesCalled = true
        }

        func displayError(_ error: Error) {
            displayErrorCalled = true
        }
    }

    // MARK: Tests

    func testPresentSomething() {
    // Given
        let spy = sut.viewController as! HomeViewControllerSpy
    
    // When
    sut.presentFetchedImages([])
    
    // Then
    XCTAssertTrue(spy.displayFetchedImagesCalled, "displayFetchedImages(_ images: [Gallery.ImageMetadata]) should ask the view controller to display the images")
    }

    func testPresentError() {
        // Given
        let spy = sut.viewController as! HomeViewControllerSpy

        // When
        sut.presentError(TestError.mock)

        // Then
        XCTAssertTrue(spy.displayErrorCalled, "displayError(_ error: Error) should ask the view controller to display the error")
    }
}

private enum TestError: Error {
    case mock
}
