//
//  DesignablesTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class DesignablesTests: XCTestCase {
    
    // MARK: - Button

    func testShouldCreateDesignableButtonAndSetProperties() {
        let button = Button()
        button.borderRadius = 4.0
        button.borderColor = UIColor.greenColor()
        button.borderWidth = 2.0
        button.fillColor = UIColor.redColor()
        
        XCTAssertEqual(button.layer.borderWidth, button.borderWidth)
        XCTAssertEqual(button.layer.cornerRadius, button.borderRadius)
        XCTAssertEqual(UIColor(CGColor: button.layer.borderColor!), button.borderColor)
        XCTAssertEqual(UIColor(CGColor: button.layer.backgroundColor!), button.fillColor)
    }
    
    // MARK: - ImageView
    
    func testShouldCreateDesignableImageViewAndSetProperties() {
        let imageView = ImageView()
        imageView.borderRadius = 4.0
        imageView.borderColor = UIColor.greenColor()
        imageView.borderWidth = 2.0
        
        XCTAssertEqual(imageView.layer.borderWidth, imageView.borderWidth)
        XCTAssertEqual(imageView.layer.cornerRadius, imageView.borderRadius)
        XCTAssertEqual(UIColor(CGColor: imageView.layer.borderColor!), imageView.borderColor)
    }
    
    // MARK: - Label
    
    func testShouldCreateDesignableLabelAndSetProperties() {
        let label = Label()
        label.borderRadius = 4.0
        label.borderColor = UIColor.greenColor()
        label.borderWidth = 2.0
        
        XCTAssertEqual(label.layer.borderWidth, label.borderWidth)
        XCTAssertEqual(label.layer.cornerRadius, label.borderRadius)
        XCTAssertEqual(UIColor(CGColor: label.layer.borderColor!), label.borderColor)
    }
    
    // MARK: - View

    func testShouldCreateDesignableViewAndSetProperties() {
        let view = View()
        view.borderRadius = 4.0
        view.borderColor = UIColor.greenColor()
        view.borderWidth = 2.0
        view.fillColor = UIColor.redColor()
        
        XCTAssertEqual(view.layer.borderWidth, view.borderWidth)
        XCTAssertEqual(view.layer.cornerRadius, view.borderRadius)
        XCTAssertEqual(UIColor(CGColor: view.layer.borderColor!), view.borderColor)
        XCTAssertEqual(UIColor(CGColor: view.layer.backgroundColor!), view.fillColor)
    }
}
