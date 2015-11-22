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
    
    func testShouldSetProfileDataOnView() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let profileViewCtrl = storyboard.instantiateViewControllerWithIdentifier("ProfileViewCtrl") as! ProfileViewController
        let _ = profileViewCtrl.view
        
        parseSpy.authenticatedUser = parseSpy.getMockUser()
        profileViewCtrl.accountLogic = accountLogic
        
        // Action
        profileViewCtrl.viewDidAppear(true)
        
        XCTAssertEqual(profileViewCtrl.profileName.text, "firstName lastName")
        XCTAssertEqual(profileViewCtrl.profileJobTitle.text, "Some Title")
        XCTAssertEqual(profileViewCtrl.profileClient.text, "Some Client")
    }
    
    func testShouldNotSetAnyProfileDataWhenNoAuthenticatedUserIsFound() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let profileViewCtrl = storyboard.instantiateViewControllerWithIdentifier("ProfileViewCtrl") as! ProfileViewController
        let _ = profileViewCtrl.view
        
//        Missing
//        parseSpy.authenticatedUser = parseSpy.getMockUser()
        profileViewCtrl.accountLogic = accountLogic
        
        // Action
        profileViewCtrl.viewDidAppear(true)
        
        XCTAssertEqual(profileViewCtrl.profileName.text, "")
        XCTAssertEqual(profileViewCtrl.profileJobTitle.text, "")
        XCTAssertEqual(profileViewCtrl.profileClient.text, "")
    }
    
    func testShouldNotSetAnyProfileDataWhenAccountViewLogicReturnsNilOrIsNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let profileViewCtrl = storyboard.instantiateViewControllerWithIdentifier("ProfileViewCtrl") as! ProfileViewController
        let _ = profileViewCtrl.view
        
//        Missing
//        parseSpy.authenticatedUser = parseSpy.getMockUser()
        profileViewCtrl.accountLogic = nil
        
        // Action
        profileViewCtrl.viewDidAppear(true)
        
        XCTAssertEqual(profileViewCtrl.profileName.text, "")
        XCTAssertEqual(profileViewCtrl.profileJobTitle.text, "")
        XCTAssertEqual(profileViewCtrl.profileClient.text, "")
    }
}
