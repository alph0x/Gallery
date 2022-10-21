//
//  HomeServiceManager.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

import Foundation
import UIKit

protocol HomeServiceManageable {
    func fetchImages(onCompletion: ((Result<[ImageMetadata], Error>) -> Void)?)
}

struct HomeServiceManager: HomeServiceManageable {
    func fetchImages(onCompletion: ((Result<[ImageMetadata], Error>) -> Void)?) {
        let request = URLRequest(for: .list)
        APIConfig.perform(request) { data, response, error in
            if let error {
                onCompletion?(.failure(error))
                return
            }
            do {
                let images = try JSONDecoder().decode([ImageMetadata].self,
                                                      from: data.unsafelyUnwrapped)
                onCompletion?(.success(images))
            } catch { onCompletion?(.failure(error)) }
        }
    }
}

private extension URLRequest {
    init(for path: String) {
        self = URLRequest(url: APIConfig.baseURL.appending(path: path))
    }
}

private extension String {
    static let list: String = "/v2/list"
}
