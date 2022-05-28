
import UIKit

class DetailViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = "Test test"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = "2311"
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.text = "Time to treat your pets to some new accessories! Get the Grumpy Cat collection from @petrageousdesigns available at @amazon - (Link in bio) https://grumpy.cat/gcpetrageous"
        return label
    }()
    
    private let viewButton: UIImageView = {
        let viewButton = UIImageView()
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.image = UIImage(named: "view")
        return viewButton
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.title = "Post"
        self.navigationItem.backButtonTitle = "Back"
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupCell(_ post: Post) {
        titleLabel.text = post.title
        postImageView.image = UIImage(named: post.image!)
        viewsLabel.text = String(describing: post.views!)
        descriptionLabel.text = post.description
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        [titleLabel, postImageView, viewsLabel, descriptionLabel, viewButton].forEach { scrollView.addSubview($0) }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            postImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            postImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            postImageView.heightAnchor.constraint(equalToConstant: 300),

            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),

            viewButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            viewButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            viewButton.widthAnchor.constraint(equalToConstant: 25),
            viewButton.heightAnchor.constraint(equalToConstant: 25),
            viewButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),

            viewsLabel.centerYAnchor.constraint(equalTo: viewButton.centerYAnchor),
            viewsLabel.leadingAnchor.constraint(equalTo: viewButton.trailingAnchor, constant: 8),
            viewsLabel.widthAnchor.constraint(equalToConstant: 40),
            viewsLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
}


