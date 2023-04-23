//
//  LandingButton.swift
//  Foodzilla
//
//  Created by Paweł on 28/03/2023.
//

import UIKit

class LandingButton: UIButton {

    var title: String = "" {
        didSet {
            let font = FontFamily.SFProText.semibold.font(size: 17)
            let attributes: [NSAttributedString.Key: Any] = [.font: font as Any]
            self.configuration?.attributedTitle = AttributedString(NSAttributedString(string: title, attributes: attributes))
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configuration = .filled()
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.configuration?.imagePadding = 10
    }
}
