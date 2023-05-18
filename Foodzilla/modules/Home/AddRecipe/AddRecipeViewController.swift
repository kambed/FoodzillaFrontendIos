//
//  AddRecipeViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 18/05/2023.
//

import UIKit

final class AddRecipeViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var preparationTimeTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    @IBOutlet weak var fatTextField: UITextField!
    @IBOutlet weak var sugarTextField: UITextField!
    @IBOutlet weak var proteinTextField: UITextField!
    @IBOutlet weak var saturatedFatTextField: UITextField!
    @IBOutlet weak var sodiumTextField: UITextField!
    @IBOutlet weak var carbohydratesTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imagePreviewView: UIImageView!
    @IBOutlet weak var submitButton: LandingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.cornerRadius = 10.0
        imagePreviewView.layer.cornerRadius = 30
        submitButton.title = "SUBMIT"
    }
}
