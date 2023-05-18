//
//  RecipeViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 24/04/2023.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!

    @IBOutlet weak var nutritionButton: LandingButton!

    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var recipeDescription: UILabel!

    @IBOutlet weak var tagsLabel: UILabel!

    @IBOutlet weak var ingredientsLabel: UILabel!

    @IBOutlet weak var stepsLabel: UILabel!

    @IBOutlet weak var ingredientsStackView: UIStackView!

    @IBOutlet weak var recipeTagsCollectionView: UICollectionView!
    @IBOutlet weak var starUIView: RatedView!
    @IBOutlet weak var stepsStackView: UIStackView!
    
    let recipeTagsData = [
        "week-night",
        "occasion",
        "healthy",
        "cuisine"
    ]
    
    var recipeTagsCV: RecipeTagsCV!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nutritionButton.title = "Nutrition"
        let image = UIImage(named: "image_recipe")
        recipeImage.image = image

        recipeTitle.text = "Crispy crunchy chicken"
        recipeTitle.textAlignment = .center
        recipeTitle.font = FontFamily.SFProText.bold.font(size: 22)
        let numReviews = 5
        reviewsLabel.text = "\(numReviews)  reviews"
        reviewsLabel.textColor = .systemBlue

        let underlineText = reviewsLabel.text!
        let attributedString = NSMutableAttributedString(string: underlineText, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        reviewsLabel.attributedText = attributedString
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        reviewsLabel.isUserInteractionEnabled = true
        reviewsLabel.addGestureRecognizer(tapGesture)

        descriptionLabel.font = FontFamily.SFProText.bold.font(size: 16)
        recipeDescription.text = "delicious, crunchy fried chicken. this recipe came from the ..."

        tagsLabel.font = FontFamily.SFProText.bold.font(size: 16)

        ingredientsLabel.font = FontFamily.SFProText.bold.font(size: 16)

        stepsLabel.font = FontFamily.SFProText.bold.font(size: 16)

        let recipeIngredients = ["boneless skinless chicken", "condensed cream", "egg"]

        for(_, ingredient) in recipeIngredients.enumerated() {
            let label = IngredientLabel()
            label.ingNameLabel.text = "\(ingredient)"

            ingredientsStackView.addArrangedSubview(label)
        }

        let recipeSteps = ["Combine soup", "Mix flour"]

        for(index, step) in recipeSteps.enumerated() {
            let label = UILabel()
            label.text = "\(index + 1). \(step)"
            stepsStackView.addArrangedSubview(label)

        }
        
        
        
        recipeTagsCV = RecipeTagsCV(data: recipeTagsData)
        
        recipeTagsCollectionView.register(ChipCollectionViewCell.self, forCellWithReuseIdentifier: "ChipCollectionViewCell")
        recipeTagsCollectionView.delegate = recipeTagsCV
        recipeTagsCollectionView.dataSource = recipeTagsCV
    }
    
    @objc private func labelTapped() {
//        let vc = OpinionsViewController()
//        navigationController?.pushViewController(vc, animated: true)
        
        let storyboard = UIStoryboard(name: "OpinionsViewController", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "OpinionsViewController")
        
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        starUIView.startupAnimation()
        starUIView.rating = 1.5
    }

    @IBAction func showNutrition(_ sender: Any) {

        let vc = UIStoryboard(name: "NutritionSheetViewController", bundle: nil).instantiateViewController(withIdentifier: "NutritionSheetViewController")

        vc.sheetPresentationController?.detents = [.medium(), .large()]

        self.present(vc, animated: true, completion: nil)
    }

}

class RecipeTagsCV: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
