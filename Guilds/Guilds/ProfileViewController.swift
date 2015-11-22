//
//  ViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 10/29/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var accountLogic: AccountViewLogic?
    var guildsLogic: GuildsViewLogic?

    @IBOutlet weak var imageView: ImageView!
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileJobTitle: UILabel!
    @IBOutlet weak var profileClient: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.accountLogic == nil || self.guildsLogic == nil {
            let wrapper = (UIApplication.sharedApplication().delegate as! AppDelegate).parseWrapper
            self.accountLogic = AccountViewLogic(wrapper: wrapper)
            self.guildsLogic = GuildsViewLogic(wrapper: wrapper)
        }
        
        let data = self.accountLogic!.getAccountData()
        if !data.isAuthenticated { return; }
        
        self.profileName.text = "\(data.firstName!) \(data.lastName!)"
        self.profileJobTitle.text = "Some Title"
        self.profileClient.text = "Some Client"
    }
    
    // MARK: - Table View
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Guilds": "Skills";
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        return cell;
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}