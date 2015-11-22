//
//  ViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 10/29/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var accountLogic: AccountViewLogic?

    @IBOutlet weak var imageView: ImageView!
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileJobTitle: UILabel!
    @IBOutlet weak var profileClient: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.accountLogic = AccountViewLogic()
    }
}