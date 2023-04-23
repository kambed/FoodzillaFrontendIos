//
//  SearchViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 20/04/2023.
//

import UIKit

final class SearchViewController: UIViewController {

    @IBOutlet weak var findRecipesButton: DarkButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var addButton: DarkButton!
    @IBOutlet weak var filterButton: DarkButton!

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

        filterButton.title = "Filter by"
        filterButton.configuration?.image = UIImage(systemName: "slider.horizontal.3")
        filterButton.semanticContentAttribute = .forceRightToLeft

        addButton.configuration?.image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))
        findRecipesButton.title = "FIND RECIPES"

        saveButton.tintColor = .black
        saveButton.configuration?.image = UIImage(systemName: "bookmark", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeTagFilter", for: indexPath) as? RecipeTagFilter else { fatalError() }

        cell.tagName.title = model.tags[indexPath.item]

        return cell
    }

}
