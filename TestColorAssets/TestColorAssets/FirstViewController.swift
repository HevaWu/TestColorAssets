//
//  FirstViewController.swift
//  TestColorAssets
//
//  Created by ST21235 on 2019/07/02.
//  Copyright © 2019 He Wu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var firstLabel: UILabel!
    var observer: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        print(firstLabel.tintColor)
//        firstLabel.textColor = .red
        print(firstLabel.textColor)
        observer = firstLabel.observe(\.textColor) { (label, change) in
            print(label.textColor, #line)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

