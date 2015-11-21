//
//  AccountViewLogicTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/18/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class AccountViewLogicTests: XCTestCase {
    
    // MARK: - Black Box Tests
    
    func testShouldDefaultInitializeAccountViewLogic() {
        let accountLogic = AccountViewLogic()
        
        XCTAssertNotNil(accountLogic)
    }
    
    func testShouldCallSaveObjectOnParseWrapperOnCreate() {
        let parseSpy = ParseWrapperSpy()
        let viewCtrlSpy = ViewControllerSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let accountToBeCreated = GuildAccount(username: "edowney", password: "password123", name: ("eric","downey"), email: "email", phoneNumber: "1234567890")
        
        accountLogic.createAccount(viewCtrlSpy, account: accountToBeCreated, confirmPassword: "password123")
        
        XCTAssertTrue(parseSpy.spy_saved)
    }
    
    func testShouldDisplayErrorAlertOnCreate() {
        let parseSpy = ParseWrapperSpy()
        let viewCtrlSpy = ViewControllerSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let accountToBeCreated = GuildAccount(username: "edowney", password: "password123", name: ("eric","downey"), email: "email", phoneNumber: "1234567890")
        
        accountLogic.createAccount(viewCtrlSpy, account: accountToBeCreated, confirmPassword: "different123")
        
        XCTAssertTrue(viewCtrlSpy.spy_presentedViewController)
    }
    
    // MARK: - White Box Tests
    
    func testShouldCallParseWrapperSaveObjectOnCreateAccount() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let username = "edowney"
        let password = "password123"
        let confirmPass = "password123"
        let firstName = "eric"
        let lastName = "downey"
        let email = "edowney@icct.com"
        let phoneNum = "6147740435"
        
        let success = accountLogic.createAccountWithUsername(username, andConfirmedPassword: (password, confirmPass), forUserWithName: (firstName, lastName), email: email, andPhoneNumber: phoneNum)
        
        XCTAssertTrue(success)
        XCTAssertTrue(parseSpy.spy_saved)
    }
    
    func testShouldGetFalseForCreateAccountWhenPasswordsDoNotMatch() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let username = "edowney"
        let password = "password123"
        let confirmPass = "different123"
        let firstName = "eric"
        let lastName = "downey"
        let email = "edowney@icct.com"
        let phoneNum = "6147740435"
        
        let success = accountLogic.createAccountWithUsername(username, andConfirmedPassword: (password, confirmPass), forUserWithName: (firstName, lastName), email: email, andPhoneNumber: phoneNum)
        
        XCTAssertFalse(success)
        XCTAssertFalse(parseSpy.spy_saved)
    }
    
    func testShouldDisplayAlertViewGivenValidViewController() {
        let accountLogic = AccountViewLogic()
        let viewCtrlSpy = ViewControllerSpy()
        
        let alert = accountLogic.showErrorAlertViewOn(viewCtrlSpy, withTitle: "Hello", andSubTitle: "how are you?")
        
        XCTAssertTrue(viewCtrlSpy.spy_presentedViewController)
        XCTAssertEqual(alert.actions.count, 1)
    }
}
