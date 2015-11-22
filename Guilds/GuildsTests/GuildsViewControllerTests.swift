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

    func testShouldConfigureAGuildsViewController() {
        let guildsViewCtrl = GuildsViewController()
        let navCtrl = UINavigationController(rootViewController: guildsViewCtrl)
        let _ = navCtrl.view
        let _ = guildsViewCtrl.view
        
        XCTAssertNotNil(guildsViewCtrl.guildLogic)
    }
}
