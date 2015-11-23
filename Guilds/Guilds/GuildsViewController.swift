//
//  GuildsViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class GuildsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var guildsTable: UITableView!
    
    var guildLogic: GuildsViewLogic?
    var guilds: [Guild] = []
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.guildLogic == nil {
            let wrapper = (UIApplication.sharedApplication().delegate as! AppDelegate).parseWrapper
            self.guildLogic = GuildsViewLogic(wrapper: wrapper)
        }
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.guildLogic?.getGuilds { gds in
            self.guilds = gds
            self.guildsTable.reloadData()
        }
    }
    
    // MARK: - Segue
    
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        guard let guildProfileViewCtrl = segue.destinationViewController as? GuildProfileViewController else {
            return;
        }
        guard let indexPath = self.guildsTable.indexPathForSelectedRow else {
            return;
        }
        self.guildsTable.deselectRowAtIndexPath(indexPath, animated: true)
        guildProfileViewCtrl.setGuild(self.guilds[indexPath.row])
    }
    
    // MARK: - Table View
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.guilds.count;
    }
    
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All Guilds";
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        cell.textLabel?.text = self.guilds[indexPath.row].guildName
        
        return cell;
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {}
}