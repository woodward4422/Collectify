//
//  Route.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import Alamofire



enum getRoute{
    case customCollection
    case products(id: String)
    case collects(id: String)
    
    func getURL() -> String{
        switch self {
        case .customCollection:
            return "https://shopicruit.myshopify.com/admin/custom_collections.json"
        case .collects:
            return "https://shopicruit.myshopify.com/admin/collects.json"
        case .products:
            return "https://shopicruit.myshopify.com/admin/products.json"
        }
    }

    
    func constructParams() -> Parameters {
        let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
        switch self{
        case .customCollection:
            return ["access_token": accessToken]
        case let .collects(id):
            return ["access_token": accessToken, "collection_id":id]
        case let .products(id):
            return ["access_token": accessToken,
                    "ids": id
            ]
        }
    }
}
