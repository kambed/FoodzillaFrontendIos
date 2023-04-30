//
//  PreparationTime.swift
//  Foodzilla
//
//  Created by Paweł on 24/04/2023.
//

import UIKit

protocol PreparationTimeDelegate {
    func getPreparationTime(preparationTime: Float)
}

class PreparationTime: BaseView {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var setButton: UIButton!

    var delegate: PreparationTimeDelegate!

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

        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4

        setButton.addTarget(self, action: #selector(setButtonTapped), for: .touchUpInside)
    }

    @objc
    private func setButtonTapped() {
        delegate.getPreparationTime(preparationTime: slider.value)
    }
}
