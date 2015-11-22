//
//  CreateAccountViewControllerTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class CreateAccountViewControllerTests: XCTestCase {
    
    // MARK: - Black Box Tests
    
    func testShouldCreateACreateAccountViewController() {
        let caViewCtrl = CreateAccountViewController()
        let _ = caViewCtrl.view
        
        XCTAssertNotNil(caViewCtrl.accountLogic)
    }

    func testShouldCallCreateAccountOnAccountViewLogic() {
        let accountViewLogicSpy = AccountViewLogicSpy()
        let caViewCtrl = CreateAccountViewController()
        let _ = caViewCtrl.view
        caViewCtrl.accountLogic = accountViewLogicSpy
        
        caViewCtrl.username = UITextField()
        caViewCtrl.password = UITextField()
        caViewCtrl.confirmPassword = UITextField()
        caViewCtrl.firstName = UITextField()
        caViewCtrl.lastName = UITextField()
        caViewCtrl.email = UITextField()
        caViewCtrl.phoneNum = UITextField()
        
        caViewCtrl.create(NSObject())
        
        XCTAssertTrue(accountViewLogicSpy.spy_createdAccount)
    }
}
