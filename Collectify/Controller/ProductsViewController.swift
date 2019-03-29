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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collects: [Collect]?{
        didSet{
            loadData()
        }
    }
    
    var collection: CustomCollection?
    
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
        setupCollectionView()
    }
    
    
    private func setupCollectionView(){
        
        let collectionViewLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        collectionViewLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout.estimatedItemSize = CGSize(width: view.frame.width, height: 100)
        
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
                    self.collectionView.reloadData()
                case .failure(let error):
                    print("Error getting the products")
                }
            }
        }
        
        
    }
    
    
    
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return collects?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            collectionView.register(UINib(nibName: "CollectHeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "headerCell")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "headerCell", for: indexPath) as? CollectHeaderCollectionViewCell
            cell?.collection = self.collection
            return cell!
            
        case 1:
            collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productCell")
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCollectionViewCell
            cell?.product = products?[indexPath.row]
            return cell!
            
            
            
            
        default:
            collectionView.register(UINib(nibName: "CollectHeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "headerCell")
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "headerCell", for: indexPath) as? CollectHeaderCollectionViewCell
            return cell!
            
        }
        
        
        
    }
    
    
}
    
    

    


