//
//  FeedViewController.swift
//  test3
//
//  Created by Константин Гришко on 11.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        makeButton()
    }
    
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Post", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc private func showPost() {
        let viewController = PostViewController()
        viewController.post = post
        viewController.title = post.title
        navigationController?.pushViewController(viewController, animated: true)
    }
}
