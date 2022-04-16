//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Константин Гришко on 14.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = "Waiting for something"
    
    private let profileImage: UIImageView = {
        let profileImage = UIImageView(frame: CGRect(x: 20, y: 90, width: 150, height: 150))
        profileImage.image = UIImage(named: "profile")
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.contentMode = .scaleAspectFit
        profileImage.clipsToBounds = true
        return profileImage
    }()
    
    private var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Grumpy Cat"
        fullNameLabel.frame = CGRect(x: 180, y: 130, width: 180, height: 35)
        fullNameLabel.backgroundColor = .clear
        fullNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.numberOfLines = 1
        return fullNameLabel
    }()
    
    private var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something"
        statusLabel.frame = CGRect(x: 180, y: 170, width: 180, height: 25)
        statusLabel.backgroundColor = .clear
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.numberOfLines = 1
        return statusLabel
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.frame = CGRect(x: 180, y: 200, width: 180, height: 25)
        statusTextField.placeholder = "Edit your status"
        statusTextField.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        statusTextField.backgroundColor = .white
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        statusTextField.leftViewMode = .always
        statusTextField.layer.cornerRadius = 5
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 0.5
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusTextField
    }()
    
    private lazy var setStatusButton: UIButton = {
        var button = UIButton()
        button.setTitle(Post(title:"Set status").title, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 20, y: 260, width: 350, height: 50)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 7.0
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func buttonPressed() {
        statusLabel.text = String(statusText)
        self.endEditing(true)
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text ?? "Empty"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .systemBackground
        addSubview(profileImage)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }
}
