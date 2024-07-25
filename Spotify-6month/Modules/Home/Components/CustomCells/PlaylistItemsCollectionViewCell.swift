//
//  PlaylistItemsCollectionViewCell.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 22/07/24.
//

import UIKit

class PlaylistItemsCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "playlistItemsCell"
    
    private let playImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "play")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heartImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "heart")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 12
        contentView.backgroundColor = .clear
        setUp()
    }
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        contentView.addSubview(playImage)
        contentView.addSubview(songNameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(heartImage)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                playImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                playImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                playImage.heightAnchor.constraint(equalToConstant: 37),
                playImage.widthAnchor.constraint(equalToConstant: 37),
                
                songNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                songNameLabel.leadingAnchor.constraint(equalTo: playImage.trailingAnchor, constant: 15),
                
                artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 10),
                artistNameLabel.leadingAnchor.constraint(equalTo: playImage.trailingAnchor, constant: 15),
                
                heartImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                heartImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
            ]
        )
    }
    
    func fill(with item: PlaylistItem) {
        songNameLabel.text = item.songName
        artistNameLabel.text = item.artistName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
