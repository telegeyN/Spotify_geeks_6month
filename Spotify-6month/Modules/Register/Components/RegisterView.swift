//
//  RegisterView.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 21/07/24.
//

import UIKit

protocol RegisterViewDelegate: AnyObject {
    func createAccountTapped()
    func signInTapped()
}

class RegisterView: BaseView {
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let registerLabel: UILabel = {
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
    
    private lazy var nameTextField: UITextField = {
        var field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .clear
        field.placeholder = "  Full Name"
        field.layer.cornerRadius = 30
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var emailTextField: UITextField = {
        var field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .clear
        field.placeholder = "  Enter Email"
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
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .init(hex: "#42C83C")
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Do You Have An Account? Sign In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: RegisterViewDelegate?
    
    override func setUp() {
        super.setUp()
        
        createAccountButton.addTarget(
            self,
            action: #selector(createAccountTapped),
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
        addSubview(registerLabel)
        addSubview(supportLabel)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(createAccountButton)
        addSubview(signInButton)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
                logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
                logoImage.heightAnchor.constraint(equalToConstant: 33),
                logoImage.widthAnchor.constraint(equalToConstant: 108),
                
                registerLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 48),
                registerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                registerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                registerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                supportLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 18),
                supportLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                supportLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                supportLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                nameTextField.topAnchor.constraint(equalTo: supportLabel.bottomAnchor, constant: 26),
                nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                nameTextField.heightAnchor.constraint(equalToConstant: 80),
                
                emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 14),
                emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                emailTextField.heightAnchor.constraint(equalToConstant: 80),
                
                passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 14),
                passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                passwordTextField.heightAnchor.constraint(equalToConstant: 80),
                
                createAccountButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
                createAccountButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                createAccountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                createAccountButton.heightAnchor.constraint(equalToConstant: 80),
                
                signInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),
                signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                signInButton.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
    }
    
    @objc
    private func createAccountTapped() {
        delegate?.createAccountTapped()
    }
    
    @objc
    private func signInTapped() {
        delegate?.signInTapped()
    }
}
