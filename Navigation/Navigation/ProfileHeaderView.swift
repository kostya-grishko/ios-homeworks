
import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private var startingFrame: CGRect?
    private var buttonClose = UIButton()
    private var backView = UIView(frame: .zero)
    private var zoomingImageView = UIImageView(frame: .zero)
    
    private lazy var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "profile")
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.systemGray2.cgColor
        profileImage.layer.cornerRadius = 75
        profileImage.contentMode = .scaleAspectFill
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomImageView)))
        profileImage.isUserInteractionEnabled = true
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
        button.backgroundColor = UIColor("#4885CC")
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
    
    @objc private func buttonPressed() {
        guard !statusText.isEmpty else {
            statusTextFieldAnimateEmpty()
            return
        }
        statusTextFieldAnimateNotEmpty()
        statusLabel.text = statusText
        self.endEditing(true)
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text ?? ""
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
        
        self.backgroundColor = .systemBackground
        
        [profileImage, fullNameLabel, statusLabel, statusTextField, setStatusButton].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 20),
            fullNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            statusLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            statusTextField.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            setStatusButton.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            setStatusButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func zoomImageView() {
        self.startingFrame = profileImage.superview?.convert(profileImage.frame, to: nil)
        zoomingImageView = UIImageView(frame: startingFrame!)
        zoomingImageView.backgroundColor = .systemPink
        zoomingImageView.image = profileImage.image
        
        if let keyWindow = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).flatMap({ $0.windows }).first(where: { $0.isKeyWindow }) {
            backView = UIView(frame: keyWindow.frame)
            
            setup(buttonClose)
            setup(backView)
            
            keyWindow.addSubview(backView)
            keyWindow.addSubview(zoomingImageView)
            keyWindow.addSubview(buttonClose)
            
            NSLayoutConstraint.activate([
                self.buttonClose.topAnchor.constraint(equalTo: self.backView.safeAreaLayoutGuide.topAnchor, constant: 16),
                self.buttonClose.trailingAnchor.constraint(equalTo: self.backView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                self.buttonClose.widthAnchor.constraint(equalToConstant: 20),
                self.buttonClose.heightAnchor.constraint(equalToConstant: 20)
            ])
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.backView.alpha = 0.8
                self.zoomingImageView.contentMode = .scaleAspectFill
                
                self.zoomingImageView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: self.backView.frame.height / 3)
                self.zoomingImageView.center = keyWindow.center
            } completion: { _ in }
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.buttonClose.alpha = 1
            } completion: { _ in }
        }
    }
    
    func setup(_ button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setup(_ view: UIView) {
        view.backgroundColor = .darkGray
        view.alpha = 0
    }
    
    @objc func buttonTapped() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.buttonClose.alpha = 0
            self.backView.alpha = 0
            self.profileImage.alpha = 1
            self.profileImage.isHidden = false
            self.zoomingImageView.frame = self.startingFrame!
            self.zoomingImageView.alpha = 0
        }, completion: nil)
    }
}
