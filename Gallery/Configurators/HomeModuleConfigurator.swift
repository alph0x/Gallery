//
//  HomeModuleConfigurator.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

import Foundation

struct HomeModuleConfigurator {
    static func build() -> HomeViewController {
        let controller = HomeViewController(viewModel: HomeViewModel())
        let manager = HomeServiceManager()
        let presenter = HomePresenter(viewController: controller)
        let interactor = HomeInteractor(presenter: presenter,
                                        manager: manager)
        controller.interactor = interactor

        return controller
    }
}
