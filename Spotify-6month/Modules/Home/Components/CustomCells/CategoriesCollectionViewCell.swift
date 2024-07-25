//
//  CategoriesCollectionViewCell.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 22/07/24.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "categoriesCell"
    
    private let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .gray
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
        contentView.addSubview(categoryNameLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                categoryNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                categoryNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ]
        )
    }
    
    func fill(with item: Category) {
        categoryNameLabel.text = item.categoryName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
