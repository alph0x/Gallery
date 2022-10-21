//
//  HomeViewControllerTests.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

@testable import Gallery
import XCTest

class HomeViewControllerTests: XCTestCase {
  // MARK: Subject under test
  
  var sut: HomeViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    window = UIWindow()
    setupHomeViewController()
  }
  
  override func tearDown() {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupHomeViewController() {
    sut = HomeViewController(viewModel: HomeViewModel())
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
    class HomeInteractorSpy: HomeInteractable {
        var fetchImagesCalled = false
        func fetchImages() {
            fetchImagesCalled = true
        }
  }
  
  // MARK: Tests
  
  func testShouldDoSomethingWhenViewIsLoaded() {
    // Given
    let spy = HomeInteractorSpy()
    sut.interactor = spy
    
    // When
    loadView()
    
    // Then
    XCTAssertTrue(spy.fetchImagesCalled, "viewDidLoad() should ask the interactor to do something")
  }
}
