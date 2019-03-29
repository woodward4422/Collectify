//
//  CustomCollectionService.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import enum Result.Result
import Alamofire




struct CustomCollectionService{
    
    
    
    // MARK: METHODS
    /**
     Gets all the Custom List elements and decodes them into a list of CustomCollection objects .
     
     - Parameter route: A specification(enum case) of the type of route being requested for.
     - Parameter completion: escaping closure to be used by the caller either passing in [CustomCollection] or an APIError.
     
     */
    func getAllCollections(route: GetRoute,completion: @escaping (Result<CustomCollections,APIError>) -> ()){
        
        
        AF.request(route.getURL(),method: .get, parameters: route.constructParams()).responseDecodable { (response: DataResponse<CustomCollections>) in
            switch response.result {
            case .success(let collections):
                completion(.success(collections))
            case .failure(let error):
                completion(.failure(APIError.FailedAPICall(error.localizedDescription)))
            }
            
        }
    }
    
    
    /**
     Gets all the Collects based off of a collection ID that is passed in.
     
     - Parameter route: A specification(enum case) of the type of route being requested for.
     - Parameter completion: escaping closure to be used by the caller either passing in Collects or an APIError.
     
     */
    
    func getAllCollects(route: GetRoute, completion: @escaping (Result<Collects,APIError>) -> ()){
        
         AF.request(route.getURL(),method: .get, parameters: route.constructParams()).responseDecodable { (response: DataResponse<Collects>) in
            switch response.result {
            case .success(let collects):
                completion(.success(collects))
            case .failure(let error):
                completion(.failure(APIError.FailedAPICall(error.localizedDescription)))
            }
        }
    }
    
    /**
     Gets all the Products based off of product IDs that are passed in.
     
     - Parameter route: A specification(enum case) of the type of route being requested for.
     - Parameter completion: escaping closure to be used by the caller either passing in [Product] or an APIError.
     */
    
    func getAllProducts(route: GetRoute, completion: @escaping (Result<[Product],APIError>) -> ()){
        AF.request(route.getURL(),method: .get, parameters: route.constructParams()).responseDecodable { (response: DataResponse<Products>) in
            switch response.result {
            case .success(let products):
                completion(.success(products.products))
            case .failure(let error):
                completion(.failure(APIError.FailedAPICall(error.localizedDescription)))
            }
        }
    }
}



