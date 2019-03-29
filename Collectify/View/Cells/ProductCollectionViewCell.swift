//
//  ProductCollectionViewCell.swift
//  Collectify
//
//  Created by Noah Woodward on 3/29/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    
    @IBOutlet weak var productInventory: UILabel!
    var product: Product?{
        didSet{
            setupCell()
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
        if let productImageURL = product?.image.image{
            productImage.kf.setImage(with: URL(string: productImageURL))
        }
        productTitle.text = product?.title
        if let inventory = product?.getVariantCount(){
            productInventory.text = "\(product!.getVariantCount()) Available"
        }else{
            productInventory.text = ""
        }
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
    }

}
