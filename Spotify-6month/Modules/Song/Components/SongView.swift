//
//  SongView.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 22/07/24.
//

import UIKit

protocol SongViewDelegate: AnyObject {
    func backButtonTapped()
}

class SongView: BaseView {
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 13
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nowPlayingLabel: UILabel = {
        let label = UILabel()
        label.text = "Now Playing"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let songImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .init(hex: "#404040")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let favoriteImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "heart2")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let repeatButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "repeat"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let playPauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(hex: "#42C83C")
        button.layer.cornerRadius = 35
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shuffleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "shuffle"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: SongViewDelegate?
    
    override func setUp() {
        super.setUp()
        backgroundColor = .white
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
    }
    
    override func setUpSubviews() {
        super.setUpSubviews()
        addSubview(backButton)
        addSubview(nowPlayingLabel)
        addSubview(songImage)
        addSubview(songNameLabel)
        addSubview(artistNameLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(repeatButton)
        stackView.addArrangedSubview(previousButton)
        stackView.addArrangedSubview(playPauseButton)
        stackView.addArrangedSubview(nextButton)
        stackView.addArrangedSubview(shuffleButton)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                backButton.heightAnchor.constraint(equalToConstant: 26),
                backButton.widthAnchor.constraint(equalToConstant: 26),
                
                nowPlayingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
                nowPlayingLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
                
                songImage.topAnchor.constraint(equalTo: nowPlayingLabel.bottomAnchor, constant: 18),
                songImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                songImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                songImage.heightAnchor.constraint(equalToConstant: 370),
                
                songNameLabel.topAnchor.constraint(equalTo: songImage.bottomAnchor, constant: 22),
                songNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                
                artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 14),
                artistNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                
                //                favoriteImage.centerYAnchor.constraint(equalTo: artistNameLabel.centerYAnchor),
                //                favoriteImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                //                favoriteImage.heightAnchor.constraint(equalToConstant: 26),
                //                favoriteImage.widthAnchor.constraint(equalToConstant: 26),
                
                stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -22),
                stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                playPauseButton.widthAnchor.constraint(equalToConstant: 70),
                playPauseButton.heightAnchor.constraint(equalToConstant: 70)
            ]
        )
    }
    
    @objc
    private func backTapped() {
        delegate?.backButtonTapped()
    }
    
    func setSongDetails(image: UIImage?, name: String?, artist: String?) {
        songImage.image = image
        songNameLabel.text = name
        artistNameLabel.text = artist
    }
}
