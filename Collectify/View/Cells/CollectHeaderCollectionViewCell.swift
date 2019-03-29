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
    
    @IBOutlet weak var collectImage: UIImageView!
    @IBOutlet weak var collectTitle: UILabel!
    var collection: CustomCollection? {
        didSet{
            setupCell()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
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
    
    private func setupCell(){
        collectTitle.text = self.collection?.title
        if let imageString = self.collection?.image.image{
            let collectionImageURL = URL(string: imageString)
            collectImage.kf.setImage(with: collectionImageURL)
        }
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        
    }
}
