//
//  GuildProfileViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 11/22/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class GuildProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var currentGuild: Guild?
    var guildLogic: GuildsViewLogic?
    var members: NSMutableArray?
    
    @IBOutlet weak var guildImageView: ImageView!
    @IBOutlet weak var guildName: UILabel!
    @IBOutlet weak var guildMembersTable: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.guildLogic == nil {
            let wrapper = (UIApplication.sharedApplication().delegate as! AppDelegate).parseWrapper
            self.guildLogic = GuildsViewLogic(wrapper: wrapper)
        }
        
        self.guildName.text = self.currentGuild?.guildName
        self.guildImageView.image = self.currentGuild?.guildImage
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Join", style: .Done, target: self, action: "joinGuild:")
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.whiteColor()
    }
    
    // MARK: - Actions
    
    public func setGuild(guild: Guild) {
        self.currentGuild = guild
    }
    
    func joinGuild(sender: AnyObject) {
        self.guildLogic!.joinGuild(self.currentGuild!)
    }
    
    // MARK: - Table View
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.members?.count ?? 0;
    }
    
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All Members";
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        return cell;
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {}
}