//
//  TabBarController.swift
//  TestColorAssets
//
//  Created by ST21235 on 2019/07/02.
//  Copyright © 2019 He Wu. All rights reserved.
//

import Foundation
import UIKit



class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.green
        tabBar.unselectedItemTintColor = UIColor(named: "TabBarItemLabelColor")
    }
}
