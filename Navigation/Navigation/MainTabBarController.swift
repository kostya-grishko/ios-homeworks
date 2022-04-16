//
//  MainTabBarController.swift
//  test3
//
//  Created by Константин Гришко on 11.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let feedViewController = FeedViewController()
    let profileViewController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        feedViewController.tabBarItem.title = "Feed"
        feedViewController.tabBarItem.image = UIImage(systemName: "house")
        profileViewController.tabBarItem.title = "Profile"
        profileViewController.tabBarItem.image = UIImage(systemName: "person")
        feedViewController.navigationItem.title = "Feed"
        
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        feedNavigationController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [feedNavigationController, profileNavigationController]
    }
}
