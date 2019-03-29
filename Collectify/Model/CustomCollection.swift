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
    var body: String
    

}

extension CustomCollection{
    enum CodingKeys: String, CodingKey{
        case title
        case id
        case image
        case body = "body_html"
    }
}
