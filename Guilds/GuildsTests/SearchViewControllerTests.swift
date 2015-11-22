//
//  SearchViewControllerTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/22/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class SearchViewControllerTests: XCTestCase {

    func testShouldCreateAProfileViewController() {
        let searchViewCtrl = SearchViewController()
        let _ = searchViewCtrl.view
        
        XCTAssertNotNil(searchViewCtrl.searchLogic)
    }
}
