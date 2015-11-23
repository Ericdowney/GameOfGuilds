//
//  AddGuildViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 11/22/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class AddGuildViewController: UIViewController {
    
    var guildLogic: GuildsViewLogic?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.guildLogic == nil {
            let wrapper = (UIApplication.sharedApplication().delegate as! AppDelegate).parseWrapper
            self.guildLogic = GuildsViewLogic(wrapper: wrapper)
        }
    }
}