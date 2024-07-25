//
//  SignInViewController.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 21/07/24.
//

import UIKit

class SignInViewController: UIViewController {

    private let signInView: SignInView = {
        let view = SignInView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var currentNavigationController: UINavigationController? {
            return self.navigationController
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        signInView.delegate = self
        setUp()
        setupNavItem()
    }
    
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(signInView)
    }
    
    private func setupNavItem() {
        navigationItem.hidesBackButton = true
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                signInView.topAnchor.constraint(equalTo: view.topAnchor),
                signInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                signInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                signInView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

extension SignInViewController: SignInViewDelegate {
    
    func recoveryTapped() {
    }
    
    func signInTapped() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func registerTapped() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
