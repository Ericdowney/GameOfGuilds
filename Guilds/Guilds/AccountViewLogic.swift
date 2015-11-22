//
//  AccountViewLogic.swift
//  Guilds
//
//  Created by Downey, Eric on 11/18/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class AccountViewLogic: ViewLogic {
    
    var parseWrapper: ParseWrapper
    
    override public init() {
        self.parseWrapper = ParseWrapper()
        super.init()
    }
    
    public init(wrapper: ParseWrapper) {
        self.parseWrapper = wrapper
        super.init()
    }
    
    public func createAccount(viewCtrl: UIViewController, account: GuildAccount, confirmPassword: String, completionHandler: (Bool -> Void)?) {
        
        if account.password != confirmPassword || account.password == "" {
            self.showErrorAlertViewOn(viewCtrl, withTitle: "Password Error", andSubTitle: "The passwords are invalid")
            completionHandler?(false);
            return;
        }
        self.parseWrapper.validUsername(account.username) { valid in
            if valid {
                self.parseWrapper.signupUser(account.getDictionaryRepresentation()) { success in
                    completionHandler?(success)
                }
                return;
            }
            self.showErrorAlertViewOn(viewCtrl, withTitle: "Username Error", andSubTitle: "Your username is already taken.")
            completionHandler?(false)
        }
    }
    
    func showErrorAlertViewOn(viewCtrl: UIViewController, withTitle title: String, andSubTitle subTitle: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: subTitle, preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
        alert.addAction(cancel)
        
        viewCtrl.presentViewController(alert, animated: true, completion: nil)
        
        return alert;
    }
}