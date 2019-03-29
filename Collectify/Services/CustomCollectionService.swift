//
//  CustomCollectionService.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import enum Result.Result
import SwiftyJSON
import Alamofire




class CustomCollectionService{
    
    static let sharedInstance = CustomCollectionService()
    let session = URLSession.shared
    
    
    
    // MARK: METHODS
    /**
     Gets all the Custom List elements and decodes them into a list of CustomCollection objects .
     
     - Parameter completion: escaping closure to be used by the caller either passing in [CustomCollection] or an APIError.
     
     */
    func getResources(route: getRoute,completion: @escaping (Result<CustomCollections,APIError>) -> ()){
        
        
        AF.request(route.getURL(),method: .get, parameters: route.constructParams()).responseDecodable { (response: DataResponse<CustomCollections>) in
            switch response.result {
            case .success(let collections):
                completion(.success(collections))
            case .failure(let error):
                completion(.failure(APIError.FailedAPICall("Failed to get get data from API")))
            }
            
        }
        
        
//        let baseURL = route.getURL()
//        let url = URL(string: baseURL)
//        let requestURL = url?.appendingQueryParameters(route.constructParams())
//        guard let unwrappedURL = requestURL else {
//            return completion(.failure(APIError.FailedAPICall("Cannot convert URL into correct format")))
//        }
//        let request = URLRequest(url: unwrappedURL)
//
//        // Start the task and from here we will decode into our models
//        session.dataTask(with: request){ (data,response,err) in
//
//            if let data = data, let response = response{
//
//                let collections = try? JSONDecoder().decode(CustomCollections.self, from: data)
//
//                print("Collections: \(collections)")
//
//
//            } else{
//               return  completion(.failure(APIError.FailedAPICall("Failed to get data or a response")))
//            }
//
//        }.resume()
        
        
        
    }
    
    
    
    
    
    
    
    
}



extension URL {
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}

protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    /**
     This computed property returns a query parameters string from the given NSDictionary. For
     example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
     string will be @"day=Tuesday&month=January".
     @return The computed parameters string.
     */
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}
