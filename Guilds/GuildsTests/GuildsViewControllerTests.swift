//
//  GuildsViewControllerTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/22/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class GuildsViewControllerTests: XCTestCase {

    func testShouldCreateAProfileViewController() {
        let guildsViewCtrl = GuildsViewController()
        let _ = guildsViewCtrl.view
        
        XCTAssertNotNil(guildsViewCtrl.guildLogic)
    }
}
