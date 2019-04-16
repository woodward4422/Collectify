//
//  CustomCollectionNetworkLayer.swift
//  Collectify
//
//  Created by Noah Woodward on 4/15/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import enum Result.Result
import Alamofire

protocol CustomCollectionNetworkLayer{
     func getAllCollections(route: GetRoute,completion: @escaping (Result<CustomCollections,APIError>) -> ())
     func getAllCollects(route: GetRoute, completion: @escaping (Result<Collects,APIError>) -> ())
     func getAllProducts(route: GetRoute, completion: @escaping (Result<[Product],APIError>) -> ())
     
}
