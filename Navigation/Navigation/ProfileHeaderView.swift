//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Константин Гришко on 14.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {

//    MARK: - properties
    private var statusText: String = ""
    
    private let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "profile")
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.systemGray2.cgColor
        profileImage.layer.cornerRadius = 75
        profileImage.contentMode = .scaleAspectFit
        profileImage.clipsToBounds = true
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    
    private var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Grumpy Cat"
        fullNameLabel.backgroundColor = .clear
        fullNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.numberOfLines = 1
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something"
        statusLabel.backgroundColor = .clear
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.numberOfLines = 1
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.placeholder = "Edit your status"
        statusTextField.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        statusTextField.backgroundColor = .white
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        statusTextField.leftViewMode = .always
        statusTextField.layer.cornerRadius = 5
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 0.5
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    private lazy var setStatusButton: UIButton = {
        var button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 7.0
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    MARK: - funcs
    @objc private func buttonPressed() {
        guard !statusText.isEmpty else {
            statusTextFieldAnimateEmpty()
            return
        }
        statusTextFieldAnimateNotEmpty()
        statusLabel.text = statusText
        self.endEditing(true)
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text ?? "Empty"
    }
    
    private func statusTextFieldAnimateEmpty() {
        UIView.animate(withDuration: 0.5) {
            self.statusTextField.layer.borderWidth = 2
            self.statusTextField.layer.borderColor = UIColor.red.cgColor
            self.statusTextField.layer.shadowRadius = 7.0
            self.statusTextField.layer.shadowOpacity = 0.2
            self.statusTextField.layer.shadowOffset = CGSize(width: 1, height: 1)
            self.statusTextField.layer.shadowColor = UIColor.black.cgColor
        }
    }
    
    private func statusTextFieldAnimateNotEmpty() {
        UIView.animate(withDuration: 0.5) {
            self.statusTextField.layer.borderWidth = 1
            self.statusTextField.layer.borderColor = UIColor.black.cgColor
            self.statusTextField.layer.shadowRadius = 0
            self.statusTextField.layer.shadowOpacity = 0
            self.statusTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }

    private func layout() {
        [profileImage, fullNameLabel, statusLabel, statusTextField, setStatusButton].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 20),
            fullNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            statusLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            statusTextField.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            setStatusButton.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            setStatusButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
//    MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
