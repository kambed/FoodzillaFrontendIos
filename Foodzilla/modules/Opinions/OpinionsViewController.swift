//
//  OpinionsViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 27/04/2023.
//

import UIKit

final class OpinionsViewController: UIViewController {
    @IBOutlet weak var recipeName: UILabel!

    @IBOutlet weak var sortButton: LandingButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeName.text = "Crispy crunchy chicken"
        recipeName.font = FontFamily.SFProText.bold.font(size: 22)
        sortButton.title = "Sort opinions"
        sortButton.configuration?.image = UIImage(systemName: "slider.horizontal.3")
    }
}
