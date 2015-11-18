//
//  LoginViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 11/17/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
        
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    
    @IBAction func login(sender: AnyObject) {
        
    }
    
    @IBAction func forgot(sender: AnyObject) {
        
    }
    
    @IBAction func create(sender: AnyObject) {
        
    }
}