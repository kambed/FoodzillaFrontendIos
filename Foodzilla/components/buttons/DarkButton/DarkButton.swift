//
//  DarkButton.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 20/04/2023.
//

import UIKit

class DarkButton: UIButton {

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

        self.configuration?.baseBackgroundColor = UIColor(red: 63/255, green: 64/255, blue: 69/255, alpha: 1)
        self.configuration?.imagePadding = 10
    }
}
