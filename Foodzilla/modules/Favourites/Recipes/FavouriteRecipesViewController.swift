//
//  FavouriteRecipesViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 15/05/2023.
//

import UIKit

class FavouriteRecipesViewController: UIViewController {
    
    
    @IBOutlet weak var checkSearchesButton: LandingButton!
    
    @IBOutlet weak var recentCollectionView: UICollectionView!
    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    @IBOutlet weak var recentPaginationLabel: UILabel!
    @IBOutlet weak var favouritePaginationLabel: UILabel!
    
    let model: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recentCollectionView.delegate = self
        recentCollectionView.dataSource = self
        recentCollectionView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellWithReuseIdentifier: "RecipeTableViewCell")
        favouriteCollectionView.delegate = self
        favouriteCollectionView.dataSource = self
        favouriteCollectionView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellWithReuseIdentifier: "RecipeTableViewCell")
        checkSearchesButton.title = "Check searches"
    }
}


extension FavouriteRecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.recipes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeTableViewCell", for: indexPath) as? RecipeTableViewCell else { fatalError() }

        cell.recipeImage.image = model.recipes[indexPath.item].image
        cell.titleLabel.text = model.recipes[indexPath.item].title
        cell.timeLabel.text = model.recipes[indexPath.item].duration

        return cell
    }
    
}
