//
//  RegisterSignInView.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 21/07/24.
//

import UIKit

protocol RegisterSignInViewDelegate: AnyObject {
    func registerTapped()
    func signInTapped()
}

class RegisterSignInView: BaseView {
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let enjoyLabel: UILabel = {
        let view = UILabel()
        view.text = "Enjoy Listening To Music"
        view.font = .boldSystemFont(ofSize: 26)
        view.textColor = .init(UIColor(hex: "#383838"))
        view.textAlignment = .center
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Spotify is a proprietary Swedish audic streaming and media services provider"
        view.font = .systemFont(ofSize: 17)
        view.textColor = .init(UIColor(hex: "#818181"))
        view.textAlignment = .center
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .init(hex: "#42C83C")
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let billieImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "billie")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate: RegisterSignInViewDelegate?
    
    override func setUp() {
        super.setUp()
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
        addSubview(enjoyLabel)
        addSubview(descriptionLabel)
        addSubview(registerButton)
        addSubview(signInButton)
        addSubview(billieImage)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 176),
                logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
                logoImage.heightAnchor.constraint(equalToConstant: 71),
                logoImage.widthAnchor.constraint(equalToConstant: 235),
                
                enjoyLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 42),
                enjoyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                enjoyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                enjoyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                descriptionLabel.topAnchor.constraint(equalTo: enjoyLabel.bottomAnchor, constant: 22),
                descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                registerButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
                registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                registerButton.heightAnchor.constraint(equalToConstant: 73),
                registerButton.widthAnchor.constraint(equalToConstant: 147),
                
                signInButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
                signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                signInButton.heightAnchor.constraint(equalToConstant: 73),
                signInButton.widthAnchor.constraint(equalToConstant: 147),
                
                billieImage.bottomAnchor.constraint(equalTo: bottomAnchor),
                billieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
                billieImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
                billieImage.heightAnchor.constraint(equalTo: billieImage.widthAnchor, multiplier: 384.0 / 212.0)
            ]
        )
    }
    
    @objc
    private func registerTapped() {
        delegate?.registerTapped()
    }
    
    @objc
    private func signInTapped() {
        delegate?.signInTapped()
    }
}
