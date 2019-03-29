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
}

struct Product: Codable{
    let title: String
    let body: String
    let image: ProductImage
    let variants: [Variant]
    
    
    enum CodingKeys: String, CodingKey{
        case title
        case body = "body_html"
        case image
        case variants
    }
    
    func getVariantCount() -> Int{
        // Reduce all of the variants inventories so that we can get a total count for the
       let count = self.variants.reduce(0,{ (result: Int, variant) -> Int in
            result + variant.count
        }) ?? 0
        return count
    }
}


struct Variant: Codable {
    let count: Int
    
    enum CodingKeys: String, CodingKey{
        case count = "inventory_quantity"
    }
}

struct ProductImage:Codable{
    let image: String
    
    enum CodingKeys: String, CodingKey{
        case image = "src"
    }
}
