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
    
    func testShouldInitializeAccountViewLogic() {
        let wrapper = ParseWrapperSpy()
        let accountLogic1 = AccountViewLogic(wrapper: wrapper)
        let accountLogic2 = AccountViewLogic()
        
        XCTAssertNotNil(accountLogic1.parseWrapper)
        XCTAssertNotNil(accountLogic2.parseWrapper)
        XCTAssertTrue(accountLogic1.parseWrapper is ParseWrapperSpy)
    }
    
    func testShouldCallSaveObjectOnParseWrapperOnCreate() {
        let parseSpy = ParseWrapperSpy()
        let viewCtrlSpy = ViewControllerSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let accountToBeCreated = GuildAccount(username: "edowney", password: "password123", name: ("eric","downey"), email: "email", phoneNumber: "1234567890")
        
        accountLogic.createAccount(viewCtrlSpy, account: accountToBeCreated, confirmPassword: "password123", completionHandler: nil)
        
        XCTAssertTrue(parseSpy.spy_userSignedUp)
        XCTAssertTrue(parseSpy.spy_validatedUsername)
        XCTAssertFalse(viewCtrlSpy.spy_presentedViewController)
    }
    
    func testShouldDisplayErrorAlertOnCreateWithIncorrectPasswords() {
        let parseSpy = ParseWrapperSpy()
        let viewCtrlSpy = ViewControllerSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let accountToBeCreated = GuildAccount(username: "edowney", password: "password123", name: ("eric","downey"), email: "email", phoneNumber: "1234567890")
        
        accountLogic.createAccount(viewCtrlSpy, account: accountToBeCreated, confirmPassword: "different123") { _ in
            XCTAssertFalse(parseSpy.spy_userSignedUp)
            XCTAssertFalse(parseSpy.spy_validatedUsername)
            XCTAssertTrue(viewCtrlSpy.spy_presentedViewController)
        }
    }
    
    func testShouldDisplayErrorAlertOnCreateWithTakenUsername() {
        let parseSpy = ParseWrapperSpy()
        let viewCtrlSpy = ViewControllerSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let accountToBeCreated = GuildAccount(username: "", password: "password123", name: ("eric","downey"), email: "email", phoneNumber: "1234567890")
        parseSpy.spy_shouldValidateUsername = false
        
        accountLogic.createAccount(viewCtrlSpy, account: accountToBeCreated, confirmPassword: "password123") { _ in
            XCTAssertFalse(parseSpy.spy_userSignedUp)
            XCTAssertTrue(parseSpy.spy_validatedUsername)
            XCTAssertTrue(viewCtrlSpy.spy_presentedViewController)
        }
    }
    
    func testShouldDisplayAlertViewGivenValidViewController() {
        let accountLogic = AccountViewLogic()
        let viewCtrlSpy = ViewControllerSpy()
        
        let alert = accountLogic.showErrorAlertViewOn(viewCtrlSpy, withTitle: "Hello", andSubTitle: "how are you?")
        
        XCTAssertTrue(viewCtrlSpy.spy_presentedViewController)
        XCTAssertEqual(alert.actions.count, 1)
    }
}
