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

    override func viewDidLoad() {
        super.viewDidLoad()

//        configureSheet()
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

        descriptionLabel.font = FontFamily.SFProText.bold.font(size: 16)
        recipeDescription.text = "delicious, crunchy fried chicken. this recipe came from the ..."

        tagsLabel.font = FontFamily.SFProText.bold.font(size: 16)

        ingredientsLabel.font = FontFamily.SFProText.bold.font(size: 16)

        stepsLabel.font = FontFamily.SFProText.bold.font(size: 16)
    }

//    private func configureSheet() {
//        let vc = NutritionSheetViewController()
//        let navVC = UINavigationController(rootViewController: vc)
//
//        navigationController?.present(navVC, animated: true)
////        present(navVC, animated: true)
//    }

    @IBAction func showNutrition(_ sender: Any) {

//        let sheetVC = UIViewController(nibName: "NutritionSheet", bundle: nil)

//        let sheetPresentationController = UISheetPresentationController(presentedViewController: NutritionSheetViewController(), presenting: NutritionSheetViewController())
//
//        sheetPresentationController.detents = [.medium()]

        let sheetViewC = NutritionSheetViewController()
        sheetViewC.sheetPresentationController?.detents = [.medium(), .large()]

        self.present(sheetViewC, animated: true, completion: nil)

//        if let sheet = NutritionSheetViewController().sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//        }
//        self.present(NutritionSheetViewController(), animated: true, completion: nil)

//
//        present(NutritionSheetViewController(), animated: true)
//
//        if let sheetController = self.presentationController as? UISheetPresentationController {
//            sheetController.detents = [.medium()]

//        let bottomSheetVC = NutritionSheetViewController(nibName: "NutritionSheet", bundle: nil)
//        bottomSheetVC.modalPresentationStyle = .pageSheet
//        if let sheetController = bottomSheetVC.sheetPresentationController {
//            sheetController.detents = [.medium()]
//        }
//        present(bottomSheetVC, animated: true, completion: nil)

//        let nutritionSheetVC = NutritionSheetViewController()
//        nutritionSheetVC.modalPresentationStyle = .overCurrentContext
//        present(nutritionSheetVC, animated: true)
//         nutritionSheetVC.sheetPresentationController?.detents = [.medium()]
    }

}
