//
//  ProfileViewControllerTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class ProfileViewControllerTests: XCTestCase {

    func testShouldCreateAProfileViewController() {
        let profileViewCtrl = ProfileViewController()
        let _ = profileViewCtrl.view
        
        XCTAssertNotNil(profileViewCtrl.accountLogic)
    }
}
