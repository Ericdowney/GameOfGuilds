//
//  AccountViewLogicTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/18/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest
import Parse

@testable import Guilds

class AccountViewLogicTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldCreateAPFObjectOnCreateAccount() {
        let accountLogic = AccountViewLogic()
        let username = "edowney"
        let password = "password123"
        let confirmPass = "password123"
        let firstName = "eric"
        let lastName = "downey"
        let email = "edowney@icct.com"
        let phoneNum = "6147740435"
        
        let userObj = accountLogic.createAccountWithUsername(username, andConfirmedPassword: (password, confirmPass), forUserWithName: (firstName, lastName), email: email, andPhoneNumber: phoneNum)
        
        XCTAssertEqual(userObj["username"] as? String, "edowney")
        XCTAssertEqual(userObj["password"] as? String, "password123")
        XCTAssertEqual(userObj["firstName"] as? String, "eric")
        XCTAssertEqual(userObj["lastName"] as? String, "downey")
        XCTAssertEqual(userObj["email"] as? String, "edowney@icct.com")
        XCTAssertEqual(userObj["phoneNumber"] as? String, "6147740435")
    }
}
