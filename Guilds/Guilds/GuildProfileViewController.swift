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
    
    @IBOutlet weak var guildImageView: ImageView!
    @IBOutlet weak var guildName: UILabel!
    @IBOutlet weak var guildMembersTable: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.guildName.text = self.currentGuild?.guildName
        self.guildImageView.image = self.currentGuild?.guildImage
    }
    
    // MARK: - Actions
    
    public func setGuild(guild: Guild) {
        self.currentGuild = guild
    }
    
    // MARK: - Table View
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentGuild?.members.count ?? 0;
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