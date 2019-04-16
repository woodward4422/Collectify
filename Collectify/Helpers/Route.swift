//
//  Route.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import Alamofire


// The enum use here will allow for flexible networking calls by just specifying the enum case, this will also allow us to easily create the request URL and the request parameters.
enum GetRoute{
    case customCollection
    case products(id: String)
    case collects(id: String)
    
    func getPath() -> String{
        switch self {
        case .customCollection:
            return "custom_collections.json"
        case .collects:
            return "collects.json"
        case .products:
            return "products.json"
        }
    }

    
    func constructParams() -> [URLQueryItem] {
        let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
        var queryItems = [URLQueryItem(name: "access_token", value: accessToken)]
        
        switch self{
        case .customCollection:
            break
        case let .collects(id):
            queryItems.append(URLQueryItem(name:"collection_id", value:id))
        case let .products(id):
            queryItems.append(URLQueryItem(name: "ids", value: id))
        }
        
        return queryItems
    }
    
    func createURL() -> URL?{

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "shopicruit.myshopify.com"
        urlComponents.path = "/admin/" + getPath()
        urlComponents.queryItems = constructParams()
        return urlComponents.url
    }
}
