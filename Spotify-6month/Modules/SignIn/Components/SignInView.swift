//
//  SignInView.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 21/07/24.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func recoveryTapped()
    func signInTapped()
    func registerTapped()
}

class SignInView: BaseView {
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let signInLabel: UILabel = {
        let view = UILabel()
        view.text = "Sign In"
        view.font = .boldSystemFont(ofSize: 30)
        view.textColor = .init(UIColor(hex: "#383838"))
        view.textAlignment = .center
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let supportLabel: UILabel = {
        let view = UILabel()
        view.text = "If You Need Any Support Click Here"
        view.font = .systemFont(ofSize: 12)
        view.textColor = .init(UIColor(hex: "#383838"))
        view.textAlignment = .center
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var usernameTextField: UITextField = {
        var field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .clear
        field.placeholder = "  Enter Username Or Email"
        field.layer.cornerRadius = 30
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var passwordTextField: UITextField = {
        var field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .clear
        field.placeholder = "  Password"
        field.layer.cornerRadius = 30
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(systemName: "eye"))
        imageView.tintColor = .gray
        
        field.rightView = imageView
        field.rightViewMode = .always
        
        return field
    }()
    
    private let recoveryPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Recovery Password", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .init(hex: "#42C83C")
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Not A Member? Register Now", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: SignInViewDelegate?
    
    override func setUp() {
        super.setUp()
        
        recoveryPasswordButton.addTarget(
            self,
            action: #selector(recoveryTapped),
            for: .touchUpInside
        )
        
        registerButton.addTarget(
            self,
            action: #selector(registerTapped),
            for: .touchUpInside
        )
        
        signInButton.addTarget(
            self,
            action: #selector(signInTapped),
            for: .touchUpInside
        )
    }
    
    override func setUpSubviews() {
        super.setUpSubviews()
        addSubview(logoImage)
        addSubview(signInLabel)
        addSubview(supportLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(recoveryPasswordButton)
        addSubview(signInButton)
        addSubview(registerButton)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
                logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
                logoImage.heightAnchor.constraint(equalToConstant: 33),
                logoImage.widthAnchor.constraint(equalToConstant: 108),
                
                signInLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 48),
                signInLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                signInLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                signInLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                supportLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 24),
                supportLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                supportLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                supportLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                usernameTextField.topAnchor.constraint(equalTo: supportLabel.bottomAnchor, constant: 30),
                usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                usernameTextField.heightAnchor.constraint(equalToConstant: 80),
                
                passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 18),
                passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                passwordTextField.heightAnchor.constraint(equalToConstant: 80),
                
                recoveryPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 22),
                recoveryPasswordButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                recoveryPasswordButton.heightAnchor.constraint(equalToConstant: 22),
                recoveryPasswordButton.widthAnchor.constraint(equalToConstant: 136),
                
                signInButton.topAnchor.constraint(equalTo: recoveryPasswordButton.bottomAnchor, constant: 22),
                signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                signInButton.heightAnchor.constraint(equalToConstant: 80),
                
                registerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),
                registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                registerButton.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
    }
    
    @objc
    private func recoveryTapped() {
        delegate?.recoveryTapped()
    }
    
    @objc
    private func signInTapped() {
        delegate?.signInTapped()
    }
    
    @objc
    private func registerTapped() {
        delegate?.registerTapped()
    }
}
