//
//  HomeViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 05/04/2023.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet weak var recommendationLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var paginationLabel: UILabel!

    let model: HomeViewModel = HomeViewModel()

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellWithReuseIdentifier: "RecipeTableViewCell")
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

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

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
