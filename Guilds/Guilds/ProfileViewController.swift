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
    var guilds: [Guild] = []

    @IBOutlet weak var imageView: ImageView!
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileJobTitle: UILabel!
    @IBOutlet weak var profileClient: UILabel!
    @IBOutlet weak var profileTable: UITableView!
    
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
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.guildsLogic?.getUserGuilds { guilds in
            self.guilds = guilds
            self.profileTable.reloadData()
        }
    }
    
    // MARK: - Segue
    
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        guard let guildProfileViewCtrl = segue.destinationViewController as? GuildProfileViewController else {
            return;
        }
        guard let indexPath = self.profileTable.indexPathForSelectedRow else {
            return;
        }
        self.profileTable.deselectRowAtIndexPath(indexPath, animated: true)
        guildProfileViewCtrl.setGuild(self.guilds[indexPath.row])
    }
    
    // MARK: - Actions
    
    @IBAction func editProfile(sender: AnyObject) {
        
    }
    
    @IBAction func logout(sender: AnyObject) {
        self.accountLogic?.logout {
            self.accountLogic?.showStoryboardWithName("Login", onViewController: self)
        }
    }
    
    // MARK: - Table View
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.guilds.count;
        }
        return 0;
    }
    
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Guilds": "Skills";
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        if indexPath.section == 0 {
            cell.textLabel?.text = self.guilds[indexPath.row].guildName
            cell.accessoryType = .DisclosureIndicator
        }
        
        return cell;
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            self.performSegueWithIdentifier("guildProfilePage", sender: self)
        }
    }
}