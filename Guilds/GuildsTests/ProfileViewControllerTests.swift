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

    func testShouldConfigureAProfileViewController() {
        let parseSpy = ParseWrapperSpy()
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let profileViewCtrl = storyboard.instantiateViewControllerWithIdentifier("ProfileViewCtrl") as! ProfileViewController
        
        parseSpy.authenticatedUser = parseSpy.getMockUser()
        (UIApplication.sharedApplication().delegate as! AppDelegate).parseWrapper = parseSpy
        
        // Action
        let _ = profileViewCtrl.view
        
        XCTAssertEqual(profileViewCtrl.profileName.text, "firstName lastName")
        XCTAssertEqual(profileViewCtrl.profileJobTitle.text, "Some Title")
        XCTAssertEqual(profileViewCtrl.profileClient.text, "Some Client")
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).parseWrapper = ParseWrapper()
    }
    
    func testShouldNotSetAnyProfileDataWhenNoAuthenticatedUserIsFound() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let profileViewCtrl = storyboard.instantiateViewControllerWithIdentifier("ProfileViewCtrl") as! ProfileViewController
        
//        Missing
//        parseSpy.authenticatedUser = parseSpy.getMockUser()
        profileViewCtrl.accountLogic = accountLogic
        
        // Action
        let _ = profileViewCtrl.view
        
        XCTAssertEqual(profileViewCtrl.profileName.text, "")
        XCTAssertEqual(profileViewCtrl.profileJobTitle.text, "")
        XCTAssertEqual(profileViewCtrl.profileClient.text, "")
    }
    
    func testShouldNotSetAnyProfileDataWhenAccountViewLogicReturnsNilOrIsNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let profileViewCtrl = storyboard.instantiateViewControllerWithIdentifier("ProfileViewCtrl") as! ProfileViewController
        
//        Missing
//        parseSpy.authenticatedUser = parseSpy.getMockUser()
        profileViewCtrl.accountLogic = nil
        
        // Action
        let _ = profileViewCtrl.view
        
        XCTAssertEqual(profileViewCtrl.profileName.text, "")
        XCTAssertEqual(profileViewCtrl.profileJobTitle.text, "")
        XCTAssertEqual(profileViewCtrl.profileClient.text, "")
    }
    
    func testShouldReturnTwoForNumberOfSections() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let profileViewCtrl = storyboard.instantiateViewControllerWithIdentifier("ProfileViewCtrl") as! ProfileViewController
        let table = UITableView()
        parseSpy.authenticatedUser = parseSpy.getMockUser()
        profileViewCtrl.accountLogic = accountLogic
        let _ = profileViewCtrl.view
        
        // Action
        let result = profileViewCtrl.numberOfSectionsInTableView(table)
        
        XCTAssertEqual(result, 2)
    }
}
