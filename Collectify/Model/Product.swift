//
//  Product.swift
//  Collectify
//
//  Created by Noah Woodward on 3/29/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation

struct Products: Codable{
    let products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
}

struct Product: Codable{
    let title: String
    let body: String
    let image: ProductImage
    let variants: [Variant]
    
    
    init(title: String, body: String, image: ProductImage, variants: [Variant]) {
        self.title = title
        self.body = body
        self.image = image
        self.variants = variants
    }
    
    
    enum CodingKeys: String, CodingKey{
        case title
        case body = "body_html"
        case image
        case variants
    }
    
    func getVariantCount() -> Int{
        // Reduce all of the variants inventories so that we can get a total count for all variants of the product
        let count = self.variants.reduce(0,{ (result: Int, variant) -> Int in
            result + variant.count
        }) 
        return count
    }
}


struct Variant: Codable {
    let count: Int
    
    init(count: Int) {
        self.count = count
    }
    
    enum CodingKeys: String, CodingKey{
        case count = "inventory_quantity"
    }
}

struct ProductImage:Codable{
    let image: String
    
    init(image: String) {
        self.image = image
    }
    
    enum CodingKeys: String, CodingKey{
        case image = "src"
    }
}
