//
//  Collect.swift
//  Collectify
//
//  Created by Noah Woodward on 3/29/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
struct Collects: Codable {
    var collects: [Collect]
    
    init(collects: [Collect]) {
        self.collects = collects
    }
}


struct Collect: Codable{
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
}


extension Collect {
    enum CodingKeys: String, CodingKey{
        case id = "product_id"
    }
    
}
