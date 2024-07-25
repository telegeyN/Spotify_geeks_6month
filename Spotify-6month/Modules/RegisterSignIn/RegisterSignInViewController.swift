//
//  ViewController.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 21/07/24.
//

import UIKit

class RegisterSignInViewController: UIViewController {
    
    private let networkService = NetworkService.shared

    private let registerSignInView: RegisterSignInView = {
        let view = RegisterSignInView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var currentNavigationController: UINavigationController? {
            return self.navigationController
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        registerSignInView.delegate = self
        setUp()
        setupNavItem()
    }
    
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(registerSignInView)
    }
    
    private func setupNavItem() {
        navigationItem.hidesBackButton = true
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                registerSignInView.topAnchor.constraint(equalTo: view.topAnchor),
                registerSignInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                registerSignInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                registerSignInView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

extension RegisterSignInViewController: RegisterSignInViewDelegate {
    
    func registerTapped() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func signInTapped() {
        let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

