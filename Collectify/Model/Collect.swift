//
//  Collect.swift
//  Collectify
//
//  Created by Noah Woodward on 3/29/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
struct Collects: Codable {
    let collects: [Collect]
}


struct Collect: Codable{
    let id: Int
}


extension Collect {
    enum CodingKeys: String, CodingKey{
        case id = "product_id"
    }
    
}
