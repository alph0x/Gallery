//
//  APIConfig.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

import Foundation

private extension String {
    static let base: String = "https://picsum.photos"
}

struct APIConfig {
    static let baseURL: URL = URL(.base)
    static func perform(_ request: URLRequest,
                 completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
    }
}

extension URL {
    init(_ string: String) {
        guard let instance = URL(string: string) else {
            fatalError("Unconstructable URL: \(string)")
        }
        self = instance
    }
}
