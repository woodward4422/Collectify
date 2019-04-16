//
//  CustomCollectionMock.swift
//  Collectify
//
//  Created by Noah Woodward on 4/15/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import enum Result.Result
import Alamofire

struct CustomCollectionMock: CustomCollectionNetworkLayer{
    func getAllCollections(route: GetRoute, completion: @escaping (Result<CustomCollections, APIError>) -> ()) {
        var collections = [CustomCollection]()
        for i in 0..<10{
            let collection = CustomCollection(title: "Title \(i)", id: i, image: CollectionImage(image: "https://test-image-download-string/s3/\(i)"), body: "Body \(i)")
            collections.append(collection)
        }
        let customCollections = CustomCollections(collections: collections)
        completion(.success(customCollections))
    }
    
    func getAllCollects(route: GetRoute, completion: @escaping (Result<Collects, APIError>) -> ()) {
        var collections = [Collect]()
        for i in 0..<10{
            let collection = Collect(id: i)
            collections.append(collection)
        }
        let customCollection = Collects(collects: collections)
        completion(.success(customCollection))
    }
    
    func getAllProducts(route: GetRoute, completion: @escaping (Result<[Product], APIError>) -> ()) {
        var products = [Product]()
        for i in 0..<10{
            let product = Product(title: "Title \(i)", body: "Body \(i)", image: ProductImage(image: "https://test-image-download-string/s3/\(i)"), variants: [Variant(count: i), Variant(count: i + 1), Variant(count: i + 2)])
            products.append(product)
        }
        completion(.success(products))
    }
    
    
}
