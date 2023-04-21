//
//  SearchViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 20/04/2023.
//

import UIKit

final class SearchViewController: UIViewController {

    @IBOutlet weak var FindRecipesButton: DarkButton!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var AddButton: DarkButton!
    @IBOutlet weak var FilterButton: DarkButton!

    @IBOutlet weak var collectionView: UICollectionView!

    let model: SearchViewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "RecipeTagFilter", bundle: nil), forCellWithReuseIdentifier: "RecipeTagFilter")
    }

    override func loadView() {
        super.loadView()
        FilterButton.title = "Filter by"

        AddButton.configuration?.image = UIImage(systemName: "plus")
        FindRecipesButton.title = "FIND RECIPES"
        SaveButton.configuration?.image = UIImage(systemName: "bookmark")
//        ?.withTintColor(UIColor(red: 63/255, green: 64/255, blue: 69/255, alpha: 1))
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeTagFilter", for: indexPath) as? RecipeTagFilter else { fatalError() }

        cell.TagName = model.tags[indexPath.item].tagButton
        cell.DeleteButton = model.tags[indexPath.item].deleteButton

        return cell
    }

}
