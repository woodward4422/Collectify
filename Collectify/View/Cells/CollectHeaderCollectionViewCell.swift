//
//  CollectHeaderCollectionViewCell.swift
//  Collectify
//
//  Created by Noah Woodward on 3/29/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import UIKit
import Kingfisher

class CollectHeaderCollectionViewCell: UICollectionViewCell {
    
    //MARK: VARS
    @IBOutlet weak var collectImage: UIImageView!
    @IBOutlet weak var collectTitle: UILabel!
    @IBOutlet weak var bodyText: UILabel!
    
    var collection: CustomCollection? {
        didSet{
            setupCell()
        }
    }
    
    //MARK: METHODS
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // This allows for the cell to adjust in size depending the size of the content inside and the constraints set for the subviews of the cell 
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        frame.size.width = ceil(UIScreen.main.bounds.width * 0.95)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
    
    private func setupCell() {
        collectTitle.text = self.collection?.title
        if let imageString = self.collection?.image.image{
            let collectionImageURL = URL(string: imageString)
            collectImage.kf.setImage(with: collectionImageURL)
        }
        bodyText.text = self.collection?.body
        formatImage()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
    }
    
    private func formatImage() {
        // Makes the image circular
        collectImage.layer.cornerRadius = collectImage.frame.width / 2
        collectImage.clipsToBounds = true
    }
}
