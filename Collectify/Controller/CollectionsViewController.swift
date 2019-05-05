//
//  CollectionsViewController.swift
//  Collectify
//
//  Created by Noah Woodward on 3/28/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import UIKit
import FunctionalTableData
import Kingfisher

class CollectionsViewController: UITableViewController {
    // MARK: VARS
    var collectionService: CustomCollectionNetworkLayer!
    private var collections: CustomCollections?
    private let functionalData = FunctionalTableData()
    private let dpg = DispatchGroup()
    
    // MARK: METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        functionalData.tableView = tableView
        loadData()
        navSetup()
        dpg.notify(queue: .main) {
            self.render()
        }

    }
    
    private func render() {
        functionalData.renderAndDiff([
            collectionTableSection(key: "collection.section")])
    }
    
    private func collectionTableSection(key: String) -> TableSection {
        typealias CollectionCell = HostCell<CombinedView<UIImageView,UILabel>, CombinedState<ImageState,LabelState>, LayoutMarginsTableItemLayout>
        let rows = getCells()
        return TableSection(key: key, rows: rows, header: nil, footer: nil, style: SectionStyle(separators: .topAndBottom), didMoveRow: nil)
    }
    
    private func getCells() -> [CellConfigType] {
        var rows: [CellConfigType] = []
        var counter = 1
        typealias CollectionCell = HostCell<CombinedView<UIImageView,UILabel>, CombinedState<ImageState,LabelState>, LayoutMarginsTableItemLayout>
        for collection in (collections?.collections)! {
            let imageState = ImageState(url: URL(string: collection.image.image)!, width: 100.0, height: 100.0)
            let titleState = LabelState(title: collection.title, color: .white, alignment: .left)
           let cell =  CollectionCell(key: "collection.row\(counter)", state: CombinedState(state1: imageState, state2: titleState), cellUpdater: { (view,state) in
                view.stackView.spacing = 16
                
                ImageState.updateView(view.view1, state: state?.state1)
                LabelState.updateView(view.view2, state: state?.state2)
            })
            rows.append(cell)
            counter += 1
        }
        
        return rows
    }
    
    private func loadData(){
        dpg.enter()
        self.collectionService.getAllCollections(route: .customCollection) { (result) in
            switch result{
            case .success(let collections):
                self.collections = collections
                self.dpg.leave()
            case .failure(let error):
                print(error.localizedDescription)
                self.dpg.leave()
            }
        }
    }
    
    private func transitionToNext(id: String, collection: CustomCollection){
        let nextVC = ProductsViewController(service: CustomCollectionService())
        getCollects(id: id, completion: { (collects) in
            nextVC.collects = collects
        })
        nextVC.collection = collection 
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
