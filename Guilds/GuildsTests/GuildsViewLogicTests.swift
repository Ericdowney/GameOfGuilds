//
//  GuildsViewLogicTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/22/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest
import Parse

@testable import Guilds

class GuildsViewLogicTests: XCTestCase {
    
    func testShouldGetAnEmptyListOfGuildsOnGetGuilds() {
        let wrapper = ParseWrapperSpy()
        let guildsLogic = GuildsViewLogic(wrapper: wrapper)
        let expectation = expectationWithDescription("")
        var guildObjs: [Guild] = []
        
        guildsLogic.getGuilds { objs in
            guildObjs = objs
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { err in
            XCTAssertTrue(wrapper.spy_queryedClass)
            XCTAssertFalse(wrapper.spy_imageFromFile)
            XCTAssertEqual(guildObjs.count, 0)
        }
    }
    
    func testShouldGetAListOfGuildsOnGetGuilds() {
        let wrapper = ParseWrapperSpy()
        let guildsLogic = GuildsViewLogic(wrapper: wrapper)
        let expectation = expectationWithDescription("")
        var guildObjs: [Guild] = []
        let p1 = PFObject(className: "Guild")
        let p2 = PFObject(className: "Guild")
        let p3 = PFObject(className: "Guild")
        p1.objectId = "asdfad1"
        p2.objectId = "1sdaf"
        p3.objectId = "sgfg5"
        
        p1["guildName"] = "Guild_1"
        p2["guildName"] = "Guild_2"
        p3["guildName"] = "Guild_3"
        
        p1["members"] = "Guild_1"
        p2["members"] = "Guild_2"
        p3["members"] = "Guild_3"
        
        wrapper.spy_query_objsToReturn = [p1, p2, p3]
        
        guildsLogic.getGuilds { objs in
            guildObjs = objs
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { err in
            XCTAssertTrue(wrapper.spy_queryedClass)
            XCTAssertTrue(wrapper.spy_imageFromFile)
            XCTAssertEqual(guildObjs.count, 3)
        }
    }
    
    func testShouldGetAnEmptyListOfGuildsOnGetUserGuilds() {
        let wrapper = ParseWrapperSpy()
        let guildsLogic = GuildsViewLogic(wrapper: wrapper)
        let expectation = expectationWithDescription("")
        var guildObjs: [Guild] = []
        
        guildsLogic.getUserGuilds { objs in
            guildObjs = objs
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { err in
            XCTAssertFalse(wrapper.spy_imageFromFile)
            XCTAssertEqual(guildObjs.count, 0)
        }
    }
    
    func testShouldGetAListOfGuildsOnGetUserGuilds() {
        let wrapper = ParseWrapperSpy()
        let guildsLogic = GuildsViewLogic(wrapper: wrapper)
        let expectation = expectationWithDescription("")
        var guildObjs: [Guild] = []
        let p1 = PFObject(className: "Guild")
        let p2 = PFObject(className: "Guild")
        let p3 = PFObject(className: "Guild")
        p1.objectId = "asdfad1"
        p2.objectId = "1sdaf"
        p3.objectId = "sgfg5"
        
        p1["guildName"] = "Guild_1"
        p2["guildName"] = "Guild_2"
        p3["guildName"] = "Guild_3"
        
        p1["members"] = "Guild_1"
        p2["members"] = "Guild_2"
        p3["members"] = "Guild_3"
        
        wrapper.spy_memberGuilds_objsToReturn = [p1, p2, p3]
        
        guildsLogic.getUserGuilds { objs in
            guildObjs = objs
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { err in
            XCTAssertTrue(wrapper.spy_imageFromFile)
            XCTAssertEqual(guildObjs.count, 3)
        }
    }
    
    func testShouldCallSaveObject() {
        let wrapper = ParseWrapperSpy()
        let guildsLogic = GuildsViewLogic(wrapper: wrapper)
        let expectation = expectationWithDescription("")
//        let testGuild = Guild(objectId: "", guildName: "", guildImage: nil, members: NSObject(), tags: NSObject())

        guildsLogic.createGuild("", description: "", image: UIImage()) {
            expectation.fulfill()
        }
        waitForExpectationsWithTimeout(1.0) { err in
            XCTAssertTrue(wrapper.spy_saved)
            XCTAssertTrue(wrapper.spy_savedImage)
        }
    }
    
    func testShouldCallAddCurrentUserToGuild() {
        let wrapper = ParseWrapperSpy()
        let guildsLogic = GuildsViewLogic(wrapper: wrapper)
        let testGuild = Guild(objectId: "", guildName: "", guildImage: nil, members: NSObject(), tags: NSObject())
        
        guildsLogic.joinGuild(testGuild)
        
        XCTAssertTrue(wrapper.spy_addUserToGuild)
    }
}
