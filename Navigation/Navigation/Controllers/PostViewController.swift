//
//  PostViewController.swift
//  test3
//
//  Created by Константин Гришко on 11.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post = Post()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        makeBarItem()
    }
    
    private func makeBarItem() {
        let barButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func tapAction() {
        let viewController = InfoViewController()
        viewController.title = "Info"
        present(viewController, animated: true)
    }
}
