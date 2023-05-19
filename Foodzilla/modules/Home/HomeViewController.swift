//
//  HomeViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 05/04/2023.
//

import UIKit

protocol RecipeTableViewCellDelegate: AnyObject {
    func didTapRecipeCell(_ cell: RecipeTableViewCell)
}

final class HomeViewController: UIViewController, Storyboarded {
    @IBOutlet weak var recommendationLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var paginationLabel: UILabel!

    var model: HomeViewModel = HomeViewModel()

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellWithReuseIdentifier: "RecipeTableViewCell")
        
        Task {
            do {
                let creds = try await ApolloGraphQLClient.shared.loginUser(user: User(username: "username123", password: "Password123!"))
                ApolloGraphQLClient.shared.updateBearerToken(token: creds.login!.token)
                try await model.fetchRecipes()
                collectionView.reloadSections(IndexSet(integer: 0))
            } catch let err {
                print(err)
            }
        }
    }

    override func loadView() {
        super.loadView()
        recommendationLabel.font = FontFamily.SFProText.semibold.font(size: 18)
        paginationLabel.font = FontFamily.SFProText.semibold.font(size: 14)
        paginationLabel.textColor = UIColor.systemBlue
        greetingLabel.font = FontFamily.SFProText.medium.font(size: 20)
        usernameLabel.font = FontFamily.SFProText.medium.font(size: 20)
        avatarImage.layer.cornerRadius = 20.0
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
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.recipes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeTableViewCell", for: indexPath) as? RecipeTableViewCell else { fatalError("Failed to dequeue RecipetableViewCell") }
        
//        cell.configure(with:model.recipes[indexPath.item])
        
        cell.delegate = self

        cell.recipeImage.image = model.recipes[indexPath.item].image
        cell.titleLabel.text = model.recipes[indexPath.item].name
        cell.timeLabel.text = "\(model.recipes[indexPath.item].timeOfPreparation) mins"

        return cell
    }

}

extension HomeViewController: RecipeTableViewCellDelegate {
    func didTapRecipeCell(_ cell: RecipeTableViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else {
            return
        }
        let recipe = model.recipes[indexPath.item]
        showRecipeDetail(recipe)
    }
}
