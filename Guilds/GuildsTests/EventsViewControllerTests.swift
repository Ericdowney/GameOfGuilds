//
//  EventsViewControllerTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/22/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class EventsViewControllerTests: XCTestCase {

    func testShouldConfigureAEventsViewController() {
        let eventsViewCtrl = EventsViewController()
        let _ = eventsViewCtrl.view
        
        XCTAssertNotNil(eventsViewCtrl.eventsLogic)
    }
}
