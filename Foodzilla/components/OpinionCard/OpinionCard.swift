//
//  OpinionCard.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 27/04/2023.
//

import UIKit

class OpinionCard: BaseView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var starUIView: UIView!
    @IBOutlet weak var opinionDescription: UILabel!
    override init(frame: CGRect) {
            super.init(frame: frame)
            setUp()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setUp()
        }

        private func setUp() {

            self.backgroundColor = .white
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowRadius = 4
        }

}
