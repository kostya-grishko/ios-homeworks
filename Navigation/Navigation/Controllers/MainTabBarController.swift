
import UIKit

class MainTabBarController: UITabBarController {
    
    let feedViewController = FeedViewController()
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
        loginViewController.navigationItem.title = "Login"
        
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        let loginNavigationController = UINavigationController(rootViewController: loginViewController)
        feedNavigationController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [loginNavigationController, feedNavigationController]
    }
}
