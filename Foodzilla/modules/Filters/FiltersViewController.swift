//
//  FiltersViewController.swift
//  Foodzilla
//
//  Created by Paweł on 24/04/2023.
//

import UIKit
import MaterialComponents

class FiltersViewController: UIViewController {

    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var preparationTime: PreparationTime!
    @IBOutlet var recentTagsLabel: UILabel!
    @IBOutlet var otherTagsLabel: UILabel!
    @IBOutlet var recentTagsCollectionView: UICollectionView!
    @IBOutlet var otherTagsCollectionView: UICollectionView!
    
    let recentTagsData = [
        "dietary",
        "low-carb",
        "lactose",
        "main-dish",
        "side-dishes",
        "easy",
        "greens",
        "gluten-free",
        "vegetables",
        "high-calcium"
    ]
    
    let otherTagsData = [
        "week-night",
        "occasion",
        "healthy",
        "cuisine"
    ]
    
    var recentTagsCV: RecentTagsCV!
    var otherTagsCV: OtherTagsCV!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = "tags will be applied in order to filter recipes in search tab"
        recentTagsLabel.text = "Recent tags"
        otherTagsLabel.text = "Other tags"
        
        recentTagsCV = RecentTagsCV(data: recentTagsData)
        otherTagsCV = OtherTagsCV(data: otherTagsData)

        preparationTime.delegate = self
        
        recentTagsCollectionView.register(ChipCollectionViewCell.self, forCellWithReuseIdentifier: "ChipCollectionViewCell")
        recentTagsCollectionView.delegate = recentTagsCV
        recentTagsCollectionView.dataSource = recentTagsCV
        
        otherTagsCollectionView.register(ChipCollectionViewCell.self, forCellWithReuseIdentifier: "ChipCollectionViewCell")
        otherTagsCollectionView.delegate = otherTagsCV
        otherTagsCollectionView.dataSource = otherTagsCV
    }
}

extension FiltersViewController: PreparationTimeDelegate {
    func getPreparationTime(preparationTime: Float) {
        print(preparationTime)
    }
}

class RecentTagsCV: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        return cell
    }
    
    
}

class OtherTagsCV: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        return cell
    }
    
    
}


