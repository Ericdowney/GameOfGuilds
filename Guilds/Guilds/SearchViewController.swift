//
//  SearchViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class SearchViewController: UIViewController {
    
    var searchLogic: SearchViewLogic?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.searchLogic == nil {
            let wrapper = (UIApplication.sharedApplication().delegate as! AppDelegate).parseWrapper
            self.searchLogic = SearchViewLogic(wrapper: wrapper)
        }
    }
}