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
        
        accountLogic.createAccount(viewCtrlSpy, account: accountToBeCreated, confirmation: ("password123", "email"), completionHandler: nil)
        
        XCTAssertTrue(parseSpy.spy_userSignedUp)
        XCTAssertTrue(parseSpy.spy_validatedUsername)
        XCTAssertFalse(viewCtrlSpy.spy_presentedViewController)
    }
    
    func testShouldDisplayErrorAlertOnCreateWithIncorrectPasswords() {
        let parseSpy = ParseWrapperSpy()
        let viewCtrlSpy = ViewControllerSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let accountToBeCreated = GuildAccount(username: "edowney", password: "password123", name: ("eric","downey"), email: "email", phoneNumber: "1234567890")
        let expectation = expectationWithDescription("")
        
        accountLogic.createAccount(viewCtrlSpy, account: accountToBeCreated, confirmation: ("different123", "email")) { _ in
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { err in
            XCTAssertFalse(parseSpy.spy_userSignedUp)
            XCTAssertFalse(parseSpy.spy_validatedUsername)
            XCTAssertTrue(viewCtrlSpy.spy_presentedViewController)
        }
    }
    
    func testShouldDisplayErrorAlertOnCreateWithIncorrectEmails() {
        let parseSpy = ParseWrapperSpy()
        let viewCtrlSpy = ViewControllerSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let accountToBeCreated = GuildAccount(username: "edowney", password: "password123", name: ("eric","downey"), email: "email", phoneNumber: "1234567890")
        let expectation = expectationWithDescription("")
        
        accountLogic.createAccount(viewCtrlSpy, account: accountToBeCreated, confirmation: ("password123", "another_email")) { _ in
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { err in
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
        let expectation = expectationWithDescription("")
        parseSpy.spy_shouldValidateUsername = false
        
        accountLogic.createAccount(viewCtrlSpy, account: accountToBeCreated, confirmation: ("password123", "email")) { _ in
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { err in
            XCTAssertFalse(parseSpy.spy_userSignedUp)
            XCTAssertTrue(parseSpy.spy_validatedUsername)
            XCTAssertTrue(viewCtrlSpy.spy_presentedViewController)
        }
    }
    
    func testShouldCallParseWrapperLogin() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        
        accountLogic.loginWithUsername("myUsername", andPassword: "password", completionHandler: nil)
        
        XCTAssertTrue(parseSpy.spy_loggedIn)
    }
    
    func testShouldGetAccountData() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        parseSpy.authenticatedUser = parseSpy.getMockUser()
        
        let result = accountLogic.getAccountData()
        
        XCTAssertTrue(result.isAuthenticated)
        XCTAssertEqual(result.username, "username")
        XCTAssertEqual(result.firstName, "firstName")
        XCTAssertEqual(result.lastName, "lastName")
    }
    
    func testShouldGetFalseAndNilDataIfUserIsNotLoggedInOnGetAccountData() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        
        let result = accountLogic.getAccountData()
        
        XCTAssertFalse(result.isAuthenticated)
        XCTAssertNil(result.username)
        XCTAssertNil(result.firstName)
        XCTAssertNil(result.lastName)
    }
}
