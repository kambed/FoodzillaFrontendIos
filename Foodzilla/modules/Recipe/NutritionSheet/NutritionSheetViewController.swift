//
//  NutritionSheetViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 24/04/2023.
//

import UIKit

class NutritionSheetViewController: UIViewController {

    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var sodiumLabel: UILabel!
    @IBOutlet weak var saturatedFatLabel: UILabel!
    @IBOutlet weak var carbohydratesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let calories = 127.0
        let fat = 4
        let sugar = 80
        let sodium = 1
        let protein = 7
        let saturatedFat = 1
        let carbohydrates = 8

        calorieLabel.text = "\(calories) kcal"
        fatLabel.text = "\(fat) g"
        sugarLabel.text = "\(sugar) g"
        sodiumLabel.text = "\(sodium) g"
        proteinLabel.text = "\(protein) g"
        saturatedFatLabel.text = "\(saturatedFat) g"
        carbohydratesLabel.text = "\(carbohydrates) g"
    }

}
