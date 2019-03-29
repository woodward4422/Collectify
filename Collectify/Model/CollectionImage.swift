//
//  CollectionImage.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation


struct CollectionImage: Codable{
    var image: String
    
    init(image: String){
        self.image = image
    }
    
    
    
}

extension CollectionImage{
    enum CodingKeys: String, CodingKey{
        case image = "src"
    }
}
