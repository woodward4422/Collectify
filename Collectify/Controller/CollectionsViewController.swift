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

        // Do any additional setup after loading the view.
    }


 

}


extension CollectionsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as UICollectionViewCell
        
        return cell
    }
    
    
}
