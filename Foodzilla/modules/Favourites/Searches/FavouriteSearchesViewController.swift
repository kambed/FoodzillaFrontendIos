//
//  FavouriteSearchesViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 15/05/2023.
//

import UIKit

class FavouriteSearchesViewController: UIViewController {
    @IBOutlet weak var recentSearchesCollectionView: UICollectionView!
    
    let recentSearchesData = [
        "butter, sugar, vanilla, eggs, weeknight",
        "chicken, eggs, 10 min, 300 kcal",
        "tomatoes, garlic, onion, 30 min",
        "cream, chicken, 25 min, healthy",
        "beef, easy, greens, vegetables",
    ]
    
    var recentSearchesCV: RecentSearchesCV!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let flowlayout = UICollectionViewFlowLayout()
//        flowlayout.scrollDirection = .vertical
//        flowlayout.estimatedItemSize = CGSize(width: 1, height: 1)
//        recentSearchesCollectionView.collectionViewLayout = flowlayout
        
        recentSearchesCV = RecentSearchesCV(data: recentSearchesData)
        
        recentSearchesCollectionView.register(ChipCollectionViewCell.self, forCellWithReuseIdentifier: "ChipCollectionViewCell")
        recentSearchesCollectionView.delegate = recentSearchesCV
        recentSearchesCollectionView.dataSource = recentSearchesCV
    }
}

class RecentSearchesCV: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let data: [String]
    
    init(data: [String]) {
        self.data = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipCollectionViewCell", for: indexPath) as! ChipCollectionViewCell
        let chipView = cell.chipView

        chipView.titleLabel.text = data[indexPath.item]

        let starImageView = UIImageView(image: UIImage(named: "star.fill"))
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(starImageView)
        
        chipView.translatesAutoresizingMaskIntoConstraints = false
        
//           NSLayoutConstraint.activate([
//               starImageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -8),
//               starImageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
//               starImageView.widthAnchor.constraint(equalToConstant: 20),
//               starImageView.heightAnchor.constraint(equalToConstant: 20)
//           ])
        
//        NSLayoutConstraint.activate([chipView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor)])

        return cell
    }
    
    
}
