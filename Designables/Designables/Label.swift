//
//  Label.swift
//  Designables
//
//  Created by Downey, Eric on 11/5/15.
//  Copyright © 2015 Eric Downey. All rights reserved.
//

import Foundation
import UIKit

class Label: UILabel {
    
    @IBInspectable var borderRadius: CGFloat = 0 {
        didSet {
            self.setup()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.setup()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            self.setup()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    override func prepareForInterfaceBuilder() {
        self.setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = self.borderRadius
        self.layer.borderColor = self.borderColor.CGColor
        self.layer.borderWidth = self.borderWidth
    }
}