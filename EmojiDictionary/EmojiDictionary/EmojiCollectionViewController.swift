//
//  EmojiCollectionViewController.swift
//  EmojiDictionary
//
//  Created by Adam Khalifa on 23.07.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class EmojiCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.setCollectionViewLayout(configureLayout(), animated: false)
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    private func configureLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EmojiCollectionViewCell
    
        // Configure the cell
        
        cell.emojiLabel.text = emojis[indexPath.item].symbol
        cell.nameLabel.text = emojis[indexPath.item].name
        cell.descriptionLabel.text = emojis[indexPath.item].description
    
        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
    }
}
