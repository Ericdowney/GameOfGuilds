//
//  AccountViewLogic.swift
//  Guilds
//
//  Created by Downey, Eric on 11/18/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

class AccountViewLogic: ViewLogic {
    
    var parseWrapper: ParseWrapper
    
    override init() {
        self.parseWrapper = ParseWrapper()
        super.init()
    }
    
    init(wrapper: ParseWrapper) {
        self.parseWrapper = wrapper
        super.init()
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