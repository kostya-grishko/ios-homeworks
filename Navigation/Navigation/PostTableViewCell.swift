
import UIKit

class PostTableViewCell: UITableViewCell {
    
    private var postArrayCell = ProfileViewController()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.numberOfLines = 1
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
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
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let likeButton = HeartButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.addTarget(self, action: #selector(handleHeartButtonTap(_:)), for: .touchUpInside)
        return likeButton
    }()
    
    private let viewButton: UIImageView = {
        let viewButton = UIImageView()
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.image = UIImage(named: "view")
        return viewButton
    }()
    
    @objc private func handleHeartButtonTap(_ sender: UIButton) {
        guard let button = sender as? HeartButton else { return }
        button.flipLikedState()
        let indexPathRow = sender.tag
        
        button.isLiked ? (likeLabel.text = String(describing: postArrayCell.postArray[indexPathRow].likes! + 1)) : (likeLabel.text = String(describing: postArrayCell.postArray[indexPathRow].likes!))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ post: Post) {
        titleLabel.text = post.title
        postImageView.image = UIImage(named: post.image!)
        likeLabel.text = String(describing: post.likes!)
        viewsLabel.text = post.views
        descriptionLabel.text = post.description
    }
    
    private func setupView() {
        [titleLabel, postImageView, likeLabel, viewsLabel, descriptionLabel, likeButton, viewButton].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            postImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            postImageView.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 19),
            likeLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 8),
            likeLabel.widthAnchor.constraint(equalToConstant: 40),
            
            likeButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            likeButton.widthAnchor.constraint(equalToConstant: 25),
            likeButton.heightAnchor.constraint(equalToConstant: 25),
            
            viewButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            viewButton.trailingAnchor.constraint(equalTo: viewsLabel.leadingAnchor, constant: -8),
            viewButton.widthAnchor.constraint(equalToConstant: 25),
            viewButton.heightAnchor.constraint(equalToConstant: 25),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 19),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            viewsLabel.widthAnchor.constraint(equalToConstant: 40),
        ])
        
    }
}
