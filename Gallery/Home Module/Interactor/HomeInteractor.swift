//
//  HomeInteractor.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

import Foundation
import UIKit

protocol HomeInteractable {
    func fetchImages()
}

struct HomeInteractor: HomeInteractable {
    var presenter: HomePresentable
    var manager: HomeServiceManageable

    init(presenter: HomePresentable,
         manager: HomeServiceManageable) {
        self.presenter = presenter
        self.manager = manager
    }

    func fetchImages() {
        manager.fetchImages(onCompletion: {
            switch $0 {
            case .success(let images):
                presenter.presentFetchedImages(images)
            case .failure(let error):
                presenter.presentError(error)
            }
        })
    }
}
