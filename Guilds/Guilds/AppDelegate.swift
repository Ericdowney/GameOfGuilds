//
//  AppDelegate.swift
//  Guilds
//
//  Created by Downey, Eric on 10/29/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var parseWrapper: ParseWrapper!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.parseWrapper = ParseWrapper()
        Parse.setApplicationId("VS6qVTDjXnCfXoME3OBRPzOYCsb4r3DlXNtwzYf2", clientKey: "oYmvJilW7W0VrTDfsuIGD6I0ATgdM8zdojEWoJhx")
        return true
    }
}

