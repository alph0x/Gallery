//
//  ImageCollectionViewCell.swift
//  Gallery
//
//  Created by Alfredo E. Pérez Leal on 21/10/2022.
//

import UIKit
import MapleBacon

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView! 

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    func prepareFor(metadata: ImageMetadata) {
        let width: Int = Int(UIScreen.main.bounds.size.width/3)
        imageView.setImage(with: URL(metadata.redimensionedDownloadURLPath(width: width,
                                                                           height: width)))
    }

}
