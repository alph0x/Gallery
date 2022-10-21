//
//  UICollectionViewCell+Extension.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }

    class func register(on collectionView: UICollectionView) {
        let identifier = Self.reuseIdentifier
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main),
                                forCellWithReuseIdentifier: identifier)
    }

    class func dequeue<T: UICollectionViewCell>(on collectionView: UICollectionView, with indexPath: IndexPath) -> T {
        register(on: collectionView)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: self),
                                                            for: indexPath) as? T else { fatalError() }
        return cell
    }
}
