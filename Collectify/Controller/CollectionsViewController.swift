//
//  CollectionsViewController.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController {
    // MARK: VARS
    var collectionService: CustomCollectionService
    private var collections: CustomCollections?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: INITIALIZER
    init(service: CustomCollectionService){
        self.collectionService = service
        super.init(nibName: "CollectionsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadData()
        navSetup()
        // Do any additional setup after loading the view.
    }
    
    
    
    private func setupCollectionView(){
        self.collectionView.register(UINib(nibName: "CollectionsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        
        let collectionViewLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        collectionViewLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout.estimatedItemSize = CGSize(width: view.frame.width, height: 100)
        
    }
    
    
    private func loadData(){
        self.collectionService.getAllCollections(route: .customCollection) { (result) in
            switch result{
            case .success(let collections):
                self.collections = collections
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func transitionToNext(id: String){
        let nextVC = ProductsViewController(service: CustomCollectionService())
        print()
        
        getCollects(id: id, completion: { (collects) in
            nextVC.collects = collects
        })
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func navSetup(){
        self.title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func getCollects(id: String, completion: @escaping ([Collect]?) ->()) {
        self.collectionService.getAllCollects(route: .collects(id: id)) { (result) in
            switch result{
            case .success(let loadedCollects):
               let collects = loadedCollects.collects
                completion(collects)
            case .failure(let error):
               completion(nil)
            }
        }
        
    }

 

}


extension CollectionsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Could have done this a shorter way with ?? but I thought this was cleaner for readability due to nested models
        if let unwrappedCollections = collections{
            return unwrappedCollections.collections.count
        } else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionsCollectionViewCell
       let collection = collections?.collections[indexPath.row]
       cell.collection = collection
       return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: Present an alert for error handling here
        guard let collectionsUnwrapped = collections?.collections else { return }
        let id = String(collectionsUnwrapped[indexPath.row].id)
        transitionToNext(id: id)
        
        
    }
    
    
}
