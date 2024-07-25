//
//  HomeViewController.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 21/07/24.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeView: HomeView = {
        let view = HomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        fetchAndUpdateCategoryItems()
        homeView.delegate = self
        setUp()
        setupNavItem()
    }
    
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(homeView)
    }
    
    private func setupNavItem() {
        navigationItem.hidesBackButton = true
    }
    
    func fetchAndUpdateCategoryItems() {
        NetworkService.shared.getTracks { [weak self] items in
            DispatchQueue.main.async {
                self?.homeView.updateCategoryItems(with: items ?? [])
            }
        }
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                homeView.topAnchor.constraint(equalTo: view.topAnchor),
                homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

extension HomeViewController: HomeViewDelegate {
    func songDetailsTapped(item: CategoryItem) {
        let vc = SongViewController()
        vc.songImage = item.logo
        vc.songName = item.songName
        vc.artistName = item.artistName
        navigationController?.pushViewController(vc, animated: true)
    }
}
