//
//  FavouriteRecipesViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 15/05/2023.
//

import UIKit
import Combine

class FavouriteRecipesViewController: UIViewController, Storyboarded, RecipeTableViewCellDelegate {
    
    @IBOutlet weak var checkSearchesButton: LandingButton!
    @IBOutlet weak var recentCollectionView: UICollectionView!
    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    @IBOutlet weak var recentPaginationLabel: UILabel!
    @IBOutlet weak var favouritePaginationLabel: UILabel!
    
    var model: FavouriteRecipesViewModel!
    var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recentCollectionView.delegate = self
        recentCollectionView.dataSource = self
        recentCollectionView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellWithReuseIdentifier: "RecipeTableViewCell")
        favouriteCollectionView.delegate = self
        favouriteCollectionView.dataSource = self
        favouriteCollectionView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellWithReuseIdentifier: "RecipeTableViewCell")
        checkSearchesButton.title = "Check searches"
        
        Task {
            do {
                try await model.fetchRecipes()
                recentCollectionView.reloadSections(IndexSet(integer: 0))
                favouriteCollectionView.reloadSections(IndexSet(integer: 0))
            } catch let err {
                print(err)
            }
        }
        
        model.$recipes.sink { [weak self] _ in
            guard let self else { return }
            DispatchQueue.main.async {
                self.recentCollectionView.reloadSections(IndexSet(integer: 0))
                self.favouriteCollectionView.reloadSections(IndexSet(integer: 0))
            }
        }.store(in: &cancellables)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func showRecipeDetail(_ recipe: Recipe) {
        let storyboard = UIStoryboard(name: "RecipeViewController", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "RecipeViewController")
        
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func redirectToSearches(_ sender: Any) {
        let storyboard = UIStoryboard(name: "FavouriteSearchesViewController", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "FavouriteSearchesViewController")
        
        present(vc, animated: true, completion: nil)
    }
    
    func didTapRecipeCell(_ cell: RecipeTableViewCell) {
        
        if let indexPath =  recentCollectionView.indexPath(for: cell){
            let recipe = model.recipes[indexPath.item]
            showRecipeDetail(recipe)
        }
        else if let indexPath =  favouriteCollectionView.indexPath(for: cell){
            let recipe = model.recipes[indexPath.item]
            showRecipeDetail(recipe)
        }
        
    }
}


extension FavouriteRecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.recipes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeTableViewCell", for: indexPath) as? RecipeTableViewCell else { fatalError() }

        cell.delegate = self
        cell.recipeImage.image = model.recipes[indexPath.item].image
        cell.recipeImage.contentMode = .scaleToFill
        cell.titleLabel.text = model.recipes[indexPath.item].name
        cell.timeLabel.text = "\(model.recipes[indexPath.item].timeOfPreparation)"

        return cell
    }
    
}
