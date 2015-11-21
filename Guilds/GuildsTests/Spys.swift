//
//  AccountViewLogicSpy.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit
import Guilds
import Parse

public class AccountViewLogicSpy: AccountViewLogic {
    var spy_createdAccount = false
    public override func createAccount(viewCtrl: UIViewController, account: GuildAccount, confirmPassword: String) {
        self.spy_createdAccount = true
    }
}

public class ViewControllerSpy: UIViewController {
    var spy_presentedViewController = false
    public override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        self.spy_presentedViewController = true
    }
}

public class ParseWrapperSpy: ParseWrapper {
    var spy_saved = false
    public override func saveObject(className: String, dictionary: [String : AnyObject]) -> BFTask {
        self.spy_saved = true
        return BFTask();
    }
}