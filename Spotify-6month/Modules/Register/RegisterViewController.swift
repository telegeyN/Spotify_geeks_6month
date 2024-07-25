//
//  RegisterViewController.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 21/07/24.
//

import UIKit

class RegisterViewController: UIViewController {

    private let registerView: RegisterView = {
        let view = RegisterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var currentNavigationController: UINavigationController? {
            return self.navigationController
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        registerView.delegate = self
        setUp()
        setupNavItem()
    }
    
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(registerView)
    }
    
    private func setupNavItem() {
        navigationItem.hidesBackButton = true
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                registerView.topAnchor.constraint(equalTo: view.topAnchor),
                registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

extension RegisterViewController: RegisterViewDelegate {
    
    func createAccountTapped() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func signInTapped() {
        let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
