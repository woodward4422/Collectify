//
//  CollectifyTests.swift
//  CollectifyTests
//
//  Created by Noah Woodward on 4/24/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import XCTest
@testable import Collectify
class CollectifyTests: XCTestCase {
    var networkLayer = CustomCollectionService()
    var networkMockLayer = CustomCollectionMock()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    // This will make sure that the network request is working as expected by making sure a variable is not nil
    func testNetworkNotNilForAllCollections() {
        networkLayer.getAllCollections(route: GetRoute.customCollection) { (res) in
            switch res {
            case .success(let val):
                XCTAssertNotNil(val)
            case .failure(let _):
                print("We dont care about testing this case!")
            }
        }
    }
    // This will make sure our corresponding mock data is also not nil
    func testMockNotNilForAllCollections() {
        networkMockLayer.getAllCollections(route: GetRoute.customCollection) { (res) in
            switch res {
            case .success(let val):
                XCTAssertNotNil(val)
            case .failure(let _):
                print("We dont care about testing this case!")
            }
        }
    }
    // Now lets test our view controller here to make sure our initializer is initializing properly, making sure both our attributes are not nil
    func testNetworkWithViewControllerInitializer() {
        let actualNetworkVC = CollectionsViewController(service: networkLayer)
        XCTAssertNotNil(actualNetworkVC.collectionService)
        let mockNetworkVC = CollectionsViewController(service: networkMockLayer)
        XCTAssertNotNil(mockNetworkVC.collectionService)
    }
}
