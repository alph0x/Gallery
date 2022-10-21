//
//  ImageMetadata.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

import Foundation

struct ImageMetadata: Decodable {
    let identifier: String
    let author: String
    let width: Int
    let height: Int
    let urlPath: String
    let downloadURLPath: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.author = try container.decode(String.self, forKey: .author)
        self.width = try container.decode(Int.self, forKey: .width)
        self.height = try container.decode(Int.self, forKey: .height)
        self.urlPath = try container.decode(String.self, forKey: .urlPath)
        self.downloadURLPath = try container.decode(String.self, forKey: .downloadURLPath)
    }

    func redimensionedDownloadURLPath(width: Int, height: Int) -> String {
        return downloadURLPath
            .replacingOccurrences(of: "\(self.width)", with: "\(width)")
            .replacingOccurrences(of: "\(self.height)", with: "\(height)")
    }

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case author
        case width
        case height
        case urlPath = "url"
        case downloadURLPath = "download_url"
    }
}
