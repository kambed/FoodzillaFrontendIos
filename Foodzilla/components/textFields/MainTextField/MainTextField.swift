//
//  mainTextField.swift
//  Foodzilla
//
//  Created by Paweł on 12/04/2023.
//

import UIKit

class MainTextField: BaseView {

    @IBOutlet var clearButton: UIButton!
    @IBOutlet var mainTextField: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextField()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpTextField()
    }

    private func setUpTextField() {
        mainTextField.borderStyle = .none
    }

}
