//
//  ViewController.swift
//  Foodzilla
//
//  Created by Paweł on 15/03/2023.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var getStarteButton: LandingButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("123")

    }

    override func loadView() {
        super.loadView()

        titleLabel.text = "Ready for a cooking experience?"
        titleLabel.font = FontFamily.SFProText.black.font(size: 33)
        titleLabel.textColor = .white

        descriptionLabel.text = "Make a delicious meal with the best recipes"
        descriptionLabel.font = FontFamily.SFProText.regular.font(size: 18)
        descriptionLabel.textColor = .white

        getStarteButton.title = "cos"
    }
}
