
import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Post")
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("First button", for: .normal)
        button.backgroundColor = UIColor("#4885CC")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Second button", for: .normal)
        button.backgroundColor = UIColor("#4885CC")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func showPost() {
        let viewController = PostViewController()
        viewController.post = post
        viewController.title = post.title
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func layout() {
        view.backgroundColor = .systemBackground
        view.addSubview(buttonsStackView)
        [firstButton, secondButton].forEach { buttonsStackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 100),
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}
