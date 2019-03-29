//
//  CustomCollections.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation

struct CustomCollections: Codable {
    var collections: [CustomCollection]
    
    init(collections: [CustomCollection]){
        self.collections = collections
    }
    
    
    
}


extension CustomCollections {
    enum CodingKeys: String, CodingKey{
        case collections = "custom_collections"
    }
    
}
