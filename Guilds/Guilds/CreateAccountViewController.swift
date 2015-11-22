//
//  CreateAccountViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 11/18/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class CreateAccountViewController: UIViewController, ViewLogicContainer {
    
    public var viewLogic: ViewLogic?
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var confirmEmail: UITextField!
    @IBOutlet weak var phoneNum: UITextField!

    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewLogic = AccountViewLogic()
    }
    
    // MARK: - Actions
    
    @IBAction public func create(sender: AnyObject) {
        let accountLogic = self.viewLogic as? AccountViewLogic
        let account = GuildAccount(username: self.username.text!, password: self.password.text!, name: (self.firstName.text!,self.lastName.text!), email: self.email.text!, phoneNumber: self.phoneNum.text!)
        
        accountLogic!.createAccount(self, account: account, confirmPassword: self.confirmPassword.text!) { success in
            if success {
                self.navigationController?.popToRootViewControllerAnimated(true)
                return;
            }
            accountLogic!.showErrorAlertViewOn(self, withTitle: "Unknown Error", andSubTitle: "Some Unknown Error has occurred.")
        }
    }
}