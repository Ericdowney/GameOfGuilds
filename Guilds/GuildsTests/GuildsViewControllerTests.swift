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
    
    func testShouldConfigureAGuildsViewControllerWithNilLogic() {
        let wrapper = ParseWrapperSpy()
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let guildsViewCtrl = storyboard.instantiateViewControllerWithIdentifier("GuildsViewCtrl") as! GuildsViewController
        let navCtrl = UINavigationController(rootViewController: guildsViewCtrl)
        delegate.parseWrapper = wrapper
        let _ = navCtrl.view
        let _ = guildsViewCtrl.view
        
        XCTAssertNotNil(guildsViewCtrl.guildLogic)
        
        delegate.parseWrapper = ParseWrapper()
    }

    func testShouldConfigureAGuildsViewController() {
        let wrapper = ParseWrapperSpy()
        let guildsLogic = GuildsViewLogic(wrapper: wrapper)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let guildsViewCtrl = storyboard.instantiateViewControllerWithIdentifier("GuildsViewCtrl") as! GuildsViewController
        let navCtrl = UINavigationController(rootViewController: guildsViewCtrl)
        guildsViewCtrl.guildLogic = guildsLogic
        let _ = navCtrl.view
        let _ = guildsViewCtrl.view
        
        XCTAssertNotNil(guildsViewCtrl.guildLogic)
    }
}
