//
//  ViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 10/29/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var accountLogic: AccountViewLogic?

    @IBOutlet weak var imageView: ImageView!
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileJobTitle: UILabel!
    @IBOutlet weak var profileClient: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.accountLogic == nil {
            self.accountLogic = AccountViewLogic()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let data = self.accountLogic?.getAccountData() else { return; }
        if !data.isAuthenticated { return; }
        
        self.profileName.text = "\(data.firstName!) \(data.lastName!)"
        self.profileJobTitle.text = "Some Title"
        self.profileClient.text = "Some Client"
    }
    
    // MARK: - Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Guilds": "Skills";
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}