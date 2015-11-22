//
//  ImageView.swift
//  Designables
//
//  Created by Downey, Eric on 11/5/15.
//  Copyright © 2015 Eric Downey. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class ImageView: UIImageView {
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            self.setup()
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            self.setup()
        }
    }
    
    @IBInspectable public var borderRadius: CGFloat = 0.0 {
        didSet {
            self.setup()
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setup()
    }
    
    public func setup() {
        self.layer.cornerRadius = self.borderRadius
        self.layer.borderColor = self.borderColor.CGColor
        self.layer.borderWidth = self.borderWidth
    }
}