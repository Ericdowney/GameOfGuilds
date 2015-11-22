//
//  LoginViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 11/17/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController, ViewLogicContainer {
    
    public var viewLogic: ViewLogic?
        
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewLogic = AccountViewLogic()
    }
    
    // MARK: - Actions
    
    @IBAction public func login(sender: AnyObject) {
        let accountLogic = self.viewLogic as? AccountViewLogic
        accountLogic?.loginWithUsername(self.username.text!, andPassword: self.password.text!) { success in
            if success {
                accountLogic?.showStoryboardWithName("Main", onViewController: self)
                return;
            }
            accountLogic?.showErrorAlertViewOn(self, withTitle: "Login Error", andSubTitle: "Your username or password is incorrect.")
        }
    }
}