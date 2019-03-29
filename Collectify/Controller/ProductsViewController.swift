//
//  ProductsViewController.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    //MARK: VARS
    var collects: [Collect]?{
        didSet{
            loadData()
        }
    }
    var products: [Product]?
    private var collectionService: CustomCollectionService
    

    // MARK: INITIALIZER
    init(service: CustomCollectionService){
        self.collectionService = service
        super.init(nibName: "ProductsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func loadData(){
        print("Collects: \(self.collects)")
        // Map the ids of all the products for the given collect and use this in the Route that we created
        let productIds = collects?.map{String($0.id)}.joined(separator: ",")
        if let ids = productIds{
            self.collectionService.getAllProducts(route: .products(id: ids)) { (result) in
                switch result{
                case .success(let loadedProducts):
                    self.products = loadedProducts
                case .failure(let error):
                    print("Error getting the products")
                    
                }
            }
        }
        

        }
        
        
        
    }
    
    

    


