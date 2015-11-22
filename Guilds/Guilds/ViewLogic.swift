//
//  ViewLogic.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class ViewLogic: NSObject {

    public func showErrorAlertViewOn(viewCtrl: UIViewController, withTitle title: String, andSubTitle subTitle: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: subTitle, preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
        alert.addAction(cancel)
        
        viewCtrl.presentViewController(alert, animated: true, completion: nil)
        
        return alert;
    }
    
    public func showStoryboardWithName(name: String, onViewController viewCtrl: UIViewController) {
        let storyboard = UIStoryboard(name: name, bundle: NSBundle.mainBundle())
        if let nextViewCtrl = storyboard.instantiateInitialViewController() {
            viewCtrl.navigationController?.pushViewController(nextViewCtrl, animated: true)
        }
    }
}