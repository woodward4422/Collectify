//
//  Collection.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation

struct CustomCollection: Codable {
    var title: String
    var id: Int
    var image: CollectionImage
    
    init(title: String,id: Int,image: CollectionImage){
        self.title = title
        self.id = id
        self.image = image
    }
    
}

extension CustomCollection{
    enum CodingKeys: String, CodingKey{
        case title
        case id
        case image
    }
}
