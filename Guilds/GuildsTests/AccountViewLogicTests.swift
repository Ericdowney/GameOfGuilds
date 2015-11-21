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
    
    // MARK: - Spys
    
    private class ParseWrapperSpy: ParseWrapper {
        var spy_saved = false
        private override func saveObject(className: String, dictionary: [String : AnyObject]) -> BFTask {
            self.spy_saved = true
            return BFTask();
        }
    }
    
    private class ViewControllerSpy: UIViewController {
        var spy_presentedViewController = false
        private override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
            self.spy_presentedViewController = true
        }
    }
    
    // MARK: - Tests
    
    func testShouldDefaultInitializeAccountViewLogic() {
        let accountLogic = AccountViewLogic()
        
        XCTAssertNotNil(accountLogic)
    }
    
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
        let viewCtrl = ViewControllerSpy()
        let _ = viewCtrl.view
        
        let alert = accountLogic.showErrorAlertViewOn(viewCtrl, withTitle: "Hello", andSubTitle: "how are you?")
        
        XCTAssertTrue(viewCtrl.spy_presentedViewController)
        XCTAssertEqual(alert.actions.count, 1)
    }
}
