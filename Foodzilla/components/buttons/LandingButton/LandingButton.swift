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

    override func awakeFromNib() {
        super.awakeFromNib()

        var configuration: UIButton.Configuration = .filled()
        configuration.image = UIImage(systemName: "paperplane.fill")
        configuration.imagePadding = 10
        self.configuration = configuration
    }
}
