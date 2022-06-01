
import UIKit

class LogInViewController: UIViewController {
    
    private let notificationCenter = NotificationCenter.default
    
    private let profileViewController = ProfileViewController()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    private var attentionLabel: UILabel = {
        let attentionLabel = UILabel()
        attentionLabel.font = .systemFont(ofSize: 14)
        attentionLabel.translatesAutoresizingMaskIntoConstraints = false
        attentionLabel.numberOfLines = 0
        attentionLabel.text = ""
        attentionLabel.textAlignment = NSTextAlignment.center
        attentionLabel.textColor = .systemRed
        attentionLabel.backgroundColor = .clear
        return attentionLabel
    }()
    
    private var loginDataTextField: UIStackView = {
        let loginDataTextField = UIStackView()
        loginDataTextField.axis = .vertical
        loginDataTextField.backgroundColor = .systemGray6
        loginDataTextField.distribution = .fillEqually
        loginDataTextField.translatesAutoresizingMaskIntoConstraints = false
        loginDataTextField.layer.cornerRadius = 10
        loginDataTextField.clipsToBounds = true
        loginDataTextField.layer.borderWidth = 0.5
        loginDataTextField.layer.borderColor = UIColor.lightGray.cgColor
        return loginDataTextField
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Email or phone number"
        loginTextField.font = UIFont.systemFont(ofSize: 16)
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: loginTextField.frame.height))
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.leftViewMode = .always
        loginTextField.autocapitalizationType = .none
        loginTextField.textColor = .systemGray
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: passwordTextField.frame.height))
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.leftViewMode = .always
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .systemGray
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Log in", for: .normal)
        loginButton.backgroundColor = UIColor("#4885CC")
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(moveToProfile), for: .touchUpInside)
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func validEmail(email: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validEmail = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return validEmail.evaluate(with: email)
    }

    private func validPassword(password : String) -> Bool {
        return password.count > 6
    }
    
    @objc private func moveToProfile() {
        if loginTextField.text! == "" || passwordTextField.text! == "" {
            loginDataTextFieldAnimateEmpty()
            attentionLabel.text = "Password or login fields cannot be empty"
        } else if validEmail(email: loginTextField.text!) == false {
            loginDataTextFieldAnimateEmpty()
            attentionLabel.text = "Incorrectly entered email. The email must contain the following type email@email.com"
        } else if validPassword(password: passwordTextField.text!) == false {
            loginDataTextFieldAnimateEmpty()
            attentionLabel.text = "Incorrectly typed password. The password must contain at least 6 characters"
        } else if validEmail(email: loginTextField.text!) && validPassword(password: passwordTextField.text!) == false {
            loginDataTextFieldAnimateEmpty()
            attentionLabel.text = "Incorrectly typed password. The password must contain at least 6 characters"
        } else if validEmail(email: loginTextField.text!) == false && validPassword(password: passwordTextField.text!) {
            loginDataTextFieldAnimateEmpty()
            attentionLabel.text = "Incorrectly entered email. The email must contain the following type email@email.com"
        } else if loginTextField.text! == "admin@gmail.com" && passwordTextField.text! != "admin222" {
            loginDataTextFieldAnimateEmpty()
            attentionLabel.text = "You entered the wrong password for your account. You can recover it"
            alert()
        } else if validEmail(email: loginTextField.text!) && validPassword(password: passwordTextField.text!) && passwordTextField.text! != "admin222" {
            loginDataTextFieldAnimateNotEmpty()
            attentionLabel.text = ""
        } else if loginTextField.text! == "admin@gmail.com" && passwordTextField.text! == "admin222" {
            loginDataTextFieldAnimateNotEmpty()
            attentionLabel.text = ""
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
        
    private func alert() {
        let alert = UIAlertController(title: "You entered the wrong password for your account", message: "You can recover it", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
       
    
    private func loginDataTextFieldAnimateEmpty() {
        UIView.animate(withDuration: 0.5) {
            self.loginDataTextField.layer.borderWidth = 2
            self.loginDataTextField.layer.borderColor = UIColor.red.cgColor
        }
    }

    private func loginDataTextFieldAnimateNotEmpty() {
        UIView.animate(withDuration: 0.5) {
            self.loginDataTextField.layer.borderWidth = 0.5
            self.loginDataTextField.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    // hide and show keyboard notifications
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        navigationController?.navigationBar.isHidden = true
        [logoImage, loginDataTextField, loginButton, attentionLabel].forEach { scrollView.addSubview($0) }
        [loginTextField, passwordTextField].forEach { loginDataTextField.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            logoImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            loginDataTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginDataTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            loginDataTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            loginDataTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            loginDataTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: loginDataTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            attentionLabel.heightAnchor.constraint(equalToConstant: 40),
            attentionLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            attentionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            attentionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            attentionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

// add hex to UIColor convertation func
extension UIColor {
    
    convenience init(_ hex: String, alpha: CGFloat = 1.0) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") { cString.removeFirst() }
        
        if cString.count != 6 {
            self.init("ff0000") // return red color for wrong hex input
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

