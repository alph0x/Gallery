//
//  HomePresenter.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

import Foundation
import UIKit

protocol HomePresentable {
    func presentFetchedImages(_ images: [ImageMetadata])
    func presentError(_ error: Error)
}

struct HomePresenter: HomePresentable {
    private(set) var viewController: HomeDisplayable

    init(viewController: HomeDisplayable) {
        self.viewController = viewController
    }

    func presentFetchedImages(_ images: [ImageMetadata]) {
        viewController.displayFetchedImages(images)
    }

    func presentError(_ error: Error) {
        viewController.displayError(error)
    }
}
