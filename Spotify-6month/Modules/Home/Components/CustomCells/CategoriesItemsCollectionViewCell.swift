//
//  CategoriesItemsCollectionViewCell.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 22/07/24.
//

import UIKit

class CategoriesItemsCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "categoriesItemsCell"
    
    private let songImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 18
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
        contentView.addSubview(songImage)
        
        contentView.addSubview(songNameLabel)
        contentView.addSubview(artistNameLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                songImage.topAnchor.constraint(equalTo: contentView.topAnchor),
                songImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                songImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                songImage.heightAnchor.constraint(equalToConstant: 185),
                
                songNameLabel.topAnchor.constraint(equalTo: songImage.bottomAnchor, constant: 8),
                songNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                
                artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 10),
                artistNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
            ]
        )
    }
    
    func fill(with item: CategoryItem) {
        songImage.image = item.logo
        songNameLabel.text = item.songName
        artistNameLabel.text = item.artistName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
