//
//  HomeViewModel.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

import Foundation
import UIKit

struct HomeViewModel {

    private var items: [ImageMetadata] = []
    var count: Int {
        return items.count
    }

    mutating func update(with images: [ImageMetadata]) {
        items.append(contentsOf: images)
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCollectionViewCell = ImageCollectionViewCell.dequeue(on: collectionView,
                                                                            with: indexPath)
        cell.prepareFor(metadata: items[indexPath.row])
        return cell
    }
}
