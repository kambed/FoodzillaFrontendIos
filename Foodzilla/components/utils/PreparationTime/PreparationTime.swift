//
//  PreparationTime.swift
//  Foodzilla
//
//  Created by Paweł on 24/04/2023.
//

import UIKit

class PreparationTime: BaseView {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var setButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    private func setUp() {
        titleLabel.text = "Preparation time"
        descriptionLabel.text = "in minutes"

        clearButton.setTitle("Clear", for: .normal)
        setButton.setTitle("Set", for: .normal)
    }

}
