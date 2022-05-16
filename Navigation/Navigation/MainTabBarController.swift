//
//  MainTabBarController.swift
//  test3
//
//  Created by Константин Гришко on 11.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let feedViewController = ProfileViewController()
    let loginViewController = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        UITabBar.appearance().tintColor = UIColor("#4885CC")
        
        feedViewController.tabBarItem.title = "Feed"
        feedViewController.tabBarItem.image = UIImage(systemName: "house")
        loginViewController.tabBarItem.title = "Profile"
        loginViewController.tabBarItem.image = UIImage(systemName: "person")
        feedViewController.navigationItem.title = "Feed"
        
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        let profileNavigationController = UINavigationController(rootViewController: loginViewController)
//        feedNavigationController.navigationBar.prefersLargeTitles = true
        feedNavigationController.navigationBar.isHidden = true
        
        viewControllers = [feedNavigationController, profileNavigationController]
    }
}
