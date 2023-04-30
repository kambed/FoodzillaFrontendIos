//
//  UserTagsViewController.swift
//  Foodzilla
//
//  Created by Paweł on 30/04/2023.
//

import UIKit

class UserTagsViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var chosenTagsLabel: UILabel!
    @IBOutlet var allTagsCollectionView: UICollectionView!
    @IBOutlet var chosenTagsCollectionView: UICollectionView!
    
    let model = UserTagsViewModel()
    
    var allTagsDelegate: AllTagsDelegate!
    var chosenTagsDelegate: AllTagsDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allTagsDelegate = AllTagsDelegate(data: model.allTagsData)
        chosenTagsDelegate = AllTagsDelegate(data: model.chosenTagsData)
        
        chosenTagsLabel.text = "Chosen tags:"
        titleLabel.text = "Choose tags"
        descriptionLabel.text = "tags will be automatically applied while searching recipes in search tab"
        
        allTagsCollectionView.register(ChipCollectionViewCell.self, forCellWithReuseIdentifier: "ChipCollectionViewCell")
        allTagsCollectionView.delegate = allTagsDelegate
        allTagsCollectionView.dataSource = allTagsDelegate
        
        chosenTagsCollectionView.register(ChipCollectionViewCell.self, forCellWithReuseIdentifier: "ChipCollectionViewCell")
        chosenTagsCollectionView.delegate = chosenTagsDelegate
        chosenTagsCollectionView.dataSource = chosenTagsDelegate
    }
    
    
}

class AllTagsDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
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

class ChosenTagsDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
