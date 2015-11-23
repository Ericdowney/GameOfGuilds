//
//  GuildExtensions.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

extension UINavigationController {
    func pushViewController(viewController: UIViewController, animated: Bool, completion: (Void -> Void)?) {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            pushViewController(viewController, animated: animated)
            CATransaction.commit()
    }
}

extension UIImage {
    func imageWithImage(scaledToSize newSize:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage;
    }
}