//
//  SongViewController.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 22/07/24.
//

import UIKit

class SongViewController: UIViewController {
    
    var songImage: UIImage?
    var songName: String?
    var artistName: String?

    private let songView: SongView = {
        let view = SongView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        songView.delegate = self
        setUp()
        songView.setSongDetails(image: songImage, name: songName, artist: artistName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(songView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                songView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                songView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                songView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                songView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

extension SongViewController: SongViewDelegate {
    
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
