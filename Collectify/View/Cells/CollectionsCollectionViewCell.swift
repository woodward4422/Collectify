//
//  CollectionsCollectionViewCell.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import UIKit
import Kingfisher


class CollectionsCollectionViewCell: UICollectionViewCell {
    // MARK: VARS
    var collection: CustomCollection? {
        didSet {
            setupCell()
        }
    }
    
    @IBOutlet weak var collectionImage: UIImageView!
    
    @IBOutlet weak var collectionTitle: UILabel!
    
    // MARK: METHODS
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    
    func setupCell(){
        collectionTitle.text = self.collection?.title
        if let imageString = self.collection?.image.image{
            let collectionImageURL = URL(string: imageString)
            collectionImage.kf.setImage(with: collectionImageURL)
        }
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        
        
    }
    
    
    
    
}
