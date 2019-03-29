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
        let productIds = collects?.map{String($0.id)}.joined(separator: ",")
        
        }
        
        
        
    }
    
    

    

}
