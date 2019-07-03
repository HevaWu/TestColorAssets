//
//  FirstViewController.swift
//  TestColorAssets
//
//  Created by ST21235 on 2019/07/02.
//  Copyright © 2019 He Wu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var firstLabel: UILabel! {
        didSet {
            // output:
            // Optional(UIExtendedSRGBColorSpace 1 0 0 1) <- we rewrite the color
            // Optional(kCGColorSpaceModelRGB 0 0 0 0.5 ) 38 <- it read the `named` color from xib file after `viewDidLoad`
            firstLabel.textColor = .red
        }
    }
    
    var observer: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // not use `Named Color` at xib file, we could rewrite the color at where we want
        
        // used `Named Color` at xib file, and try to rewrite it in the view controller
        // Note: should pay attention to rewrite it at viewDidLoad()
        
        // if we rewrite the color in the viewDidLoad
        // output:
        // Optional(UIExtendedSRGBColorSpace 1 0 0 1) <- we rewrite the color
        // Optional(kCGColorSpaceModelRGB 0 0 0 0.5 ) 38 <- it read the `named` color from xib file after `viewDidLoad`
//        firstLabel.textColor = .red
        print(firstLabel.textColor)
        
        // observer for checking if the color is changed
        observer = firstLabel.observe(\.textColor) { (label, change) in
            print(label.textColor, #line)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // output:
        // Optional(UIExtendedSRGBColorSpace 0.776 0.349 0.282 0.5)  <- first read `Named Color` set at viewDidLoad
        // Optional(kCGColorSpaceModelRGB 0 0 0 0.5 ) 38  <- iPhone XR device read the `display3` color
        // Optional(UIExtendedSRGBColorSpace 1 0 0 1) 38  <- rewrite color successful
//        firstLabel.textColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // output:
        // Optional(UIExtendedSRGBColorSpace 0.776 0.349 0.282 0.5) <- first read `Named Color` set at viewDidLoad
        // Optional(UIExtendedSRGBColorSpace 1 0 0 1) 38 <- rewrite color
        // Optional(kCGColorSpaceModelRGB 0 0 0 0.5 ) 38 <- iPhone XR device read the `display3` color
//        firstLabel.textColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // if we rewrite the color in the viewDidAppear
        // output:
        // Optional(UIExtendedSRGBColorSpace 0.776 0.349 0.282 0.5)  <- first read `Named Color` set at viewDidLoad
        // Optional(kCGColorSpaceModelRGB 0 0 0 0.5 ) 38  <- iPhone XR device read the `display3` color
        // Optional(UIExtendedSRGBColorSpace 1 0 0 1) 38  <- rewrite color successful
//        firstLabel.textColor = .red
    }
}

