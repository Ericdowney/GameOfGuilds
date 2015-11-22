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
    
    // MARK: - Segue
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
    }
    
    // MARK: - Actions
    
    
    @IBAction public func login(sender: AnyObject) {
        
    }
}