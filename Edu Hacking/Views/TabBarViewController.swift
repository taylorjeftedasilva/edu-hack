//
//  TabBarViewController.swift
//  Edu Hacking
//
//  Created by Taylor Jefte da silva on 03/02/22.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        navigationController?.isToolbarHidden = true
        navigationItem.hidesBackButton = true
        super.viewDidLoad()
            let vc1 = HomeViewController()
            vc1.title = "home 1"
            let vc2 = HomeViewController()
            vc2.title = "home 2"
            let vc3 = HomeViewController()
            vc3.title = "home 3"
            viewControllers = [vc1, vc2, vc3]
            self.tabBar.backgroundColor = .white
            self.tabBar.tintColor = .black
    }
    
}
