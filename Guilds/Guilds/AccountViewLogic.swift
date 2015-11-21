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
    
    public func createAccount(viewCtrl: UIViewController, account: GuildAccount, confirmPassword: String) {
        let success = self.createAccountWithUsername(account.username, andConfirmedPassword: (account.password, confirmPassword), forUserWithName: account.name, email: account.email, andPhoneNumber: account.phoneNumber)
        
        if !success {
            self.showErrorAlertViewOn(viewCtrl, withTitle: "Error Creating Account", andSubTitle: "Your passwords must match.")
        }
    }
    
    func createAccountWithUsername(username: String, andConfirmedPassword pass: (String, String), forUserWithName name: (String, String), email: String, andPhoneNumber phone: String) -> Bool {
        if pass.0 != pass.1 {
            return false;
        }
        
        self.parseWrapper.saveObject("User", dictionary: [
            "username": username,
            "password": pass.0,
            "firstName": name.0,
            "lastName": name.1,
            "email": email,
            "phoneNumber": phone
        ])
        return true;
    }
    
    func showErrorAlertViewOn(viewCtrl: UIViewController, withTitle title: String, andSubTitle subTitle: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: subTitle, preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancel)
        
        viewCtrl.presentViewController(alert, animated: true, completion: nil)
        
        return alert;
    }
}