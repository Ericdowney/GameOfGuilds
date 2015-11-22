//
//  LoginViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 11/17/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController {
    
    public var accountLogic: AccountViewLogic?
        
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.accountLogic == nil {
            let wrapper = (UIApplication.sharedApplication().delegate as! AppDelegate).parseWrapper
            self.accountLogic = AccountViewLogic(wrapper: wrapper)
        }
    }
    
    // MARK: - Actions
    
    @IBAction public func login(sender: AnyObject) {
        self.accountLogic?.loginWithUsername(self.username.text!, andPassword: self.password.text!) { success in
            if success {
                self.accountLogic?.showStoryboardWithName("Main", onViewController: self)
                return;
            }
            self.accountLogic?.showErrorAlertViewOn(self, withTitle: "Login Error", andSubTitle: "Your username or password is incorrect.")
        }
    }
}