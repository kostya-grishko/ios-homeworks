//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Константин Гришко on 15.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
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
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    
    
    
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
        likeLabel.text = "Likes: " + String(describing: post.likes!)
        viewsLabel.text = "Views: " + String(describing: post.views!)
        descriptionLabel.text = post.description
    }
    
    
    private func setupView() {
        [titleLabel, postImageView, likeLabel, viewsLabel, descriptionLabel].forEach { contentView.addSubview($0) }
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            postImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            postImageView.heightAnchor.constraint(equalToConstant: 250),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            likeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            likeLabel.widthAnchor.constraint(equalToConstant: 100),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            viewsLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        
        
        
        
        
    }
    
    
    
    
    
    

}
