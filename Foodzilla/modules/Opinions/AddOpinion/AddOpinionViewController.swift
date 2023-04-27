//
//  AddOpinionViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 27/04/2023.
//

import UIKit

class AddOpinionViewController: UIViewController {

    @IBOutlet weak var starUIView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var submitButton: LandingButton!

    @IBAction func submitOpinionAction(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.cornerRadius = 10.0

        submitButton.title = "Submit"
    }
}
