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
        // Do any additional setup after loading the view.
    }
    
    
    
    private func setupCollectionView(){
        self.collectionView.register(UINib(nibName: "CollectionsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        
        let collectionViewLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        collectionViewLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout.estimatedItemSize = CGSize(width: view.frame.width, height: 100)
        
    }
    
    
    private func loadData(){
        self.collectionService.getResources(route: .customCollection) { (result) in
            switch result{
            case .success(let collections):
                self.collections = collections
                self.collectionView.reloadData()
            case .failure(let error):
                print("Unable to get collections")
            }
        }
    }

 

}


extension CollectionsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionsCollectionViewCell
       let collection = collections?.collections[indexPath.row]
       cell.collection = collection
       return cell
    }
    
    
}
