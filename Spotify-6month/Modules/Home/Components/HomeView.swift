//
//  HomeView.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 22/07/24.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func songDetailsTapped(item: CategoryItem)
}

class HomeView: BaseView {
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.backgroundImage = UIImage()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.searchTextField.addTarget(self, action: #selector(searchBarEditingChanged), for: .editingChanged)
        return view
    }()
    
    private let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 32)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private let categoriesItemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 153, height: 280)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private let playlistLabel: UILabel = {
        let view = UILabel()
        view.text = "Playlist"
        view.font = .boldSystemFont(ofSize: 20)
        view.textColor = .init(UIColor(hex: "#383838"))
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let playlistItemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 50)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    private let categories = [
        Category(categoryName: "News"),
        Category(categoryName: "Video"),
        Category(categoryName: "Artists"),
        Category(categoryName: "Podcasts")
    ]
    
    private var categoryItems: [CategoryItem] = []
    
    private let playlistItems = [
        PlaylistItem(songName: "Bad Guy", artistName: "Billie Eilish"),
        PlaylistItem(songName: "Scorpion", artistName: "Drake"),
        PlaylistItem(songName: "Snowchild", artistName: "The Weeknd")
    ]

    weak var delegate: HomeViewDelegate?
    
    override func setUp() {
        super.setUp()
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(
            CategoriesCollectionViewCell.self,
            forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseId
        )
        categoriesCollectionView.delegate = self
        
        categoriesItemsCollectionView.dataSource = self
        categoriesItemsCollectionView.register(
            CategoriesItemsCollectionViewCell.self,
            forCellWithReuseIdentifier: CategoriesItemsCollectionViewCell.reuseId
        )
        categoriesItemsCollectionView.delegate = self
        
        playlistItemsCollectionView.dataSource = self
        playlistItemsCollectionView.register(
            PlaylistItemsCollectionViewCell.self,
            forCellWithReuseIdentifier: PlaylistItemsCollectionViewCell.reuseId
        )
        playlistItemsCollectionView.delegate = self
    }
    
    override func setUpSubviews() {
        super.setUpSubviews()
        addSubview(logoImage)
        addSubview(searchBar)
        addSubview(categoriesCollectionView)
        addSubview(categoriesItemsCollectionView)
        addSubview(playlistLabel)
        addSubview(playlistItemsCollectionView)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
                logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
                logoImage.heightAnchor.constraint(equalToConstant: 33),
                logoImage.widthAnchor.constraint(equalToConstant: 108),
                
                searchBar.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 15),
                searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                searchBar.heightAnchor.constraint(equalToConstant: 32),
                
                categoriesCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 24),
                categoriesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                categoriesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                categoriesCollectionView.heightAnchor.constraint(equalToConstant: 24),
                
                categoriesItemsCollectionView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 22),
                categoriesItemsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                categoriesItemsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                categoriesItemsCollectionView.heightAnchor.constraint(equalToConstant: 280),
                
                playlistLabel.topAnchor.constraint(equalTo: categoriesItemsCollectionView.bottomAnchor, constant: 32),
                playlistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                
                playlistItemsCollectionView.topAnchor.constraint(equalTo: playlistLabel.bottomAnchor, constant: 12),
                playlistItemsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                playlistItemsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                playlistItemsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ]
        )
    }
    
    func updateCategoryItems(with items: [CategoryItem]) {
        self.categoryItems = items
        self.categoriesItemsCollectionView.reloadData()
    }
}

extension HomeView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return categories.count
        } else if collectionView == categoriesItemsCollectionView {
            return categoryItems.count
        } else {
            return playlistItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseId, for: indexPath) as! CategoriesCollectionViewCell
            cell.fill(with: categories[indexPath.row])
            return cell
        } else if collectionView == categoriesItemsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesItemsCollectionViewCell.reuseId, for: indexPath) as! CategoriesItemsCollectionViewCell
            
            cell.fill(with: categoryItems[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistItemsCollectionViewCell.reuseId, for: indexPath) as! PlaylistItemsCollectionViewCell
            
            cell.fill(with: playlistItems[indexPath.row])
            return cell
        }
    }
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesItemsCollectionView {
            delegate?.songDetailsTapped(item: categoryItems[indexPath.row])
        }
    }
}
