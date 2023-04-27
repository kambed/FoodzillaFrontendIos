//
//  OpinionsViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 27/04/2023.
//

import UIKit

final class OpinionsViewController: UIViewController {
    @IBOutlet weak var recipeName: UILabel!

    @IBOutlet weak var opinionCard: OpinionCard!
    @IBOutlet weak var opinionCard2: OpinionCard!
    @IBOutlet weak var sortButton: LandingButton!
    @IBOutlet weak var addOpinionButton: DarkButton!

    @IBAction func addOpinionSheet(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        recipeName.text = "Crispy crunchy chicken"
        recipeName.font = FontFamily.SFProText.bold.font(size: 22)
        sortButton.title = "Sort opinions"
        sortButton.configuration?.image = UIImage(systemName: "slider.horizontal.3")

        let dateNow = Date()
        let dtFormatter = DateFormatter()
        dtFormatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")
        let formattedDateTime = dtFormatter.string(from: dateNow)
        opinionCard.dateLabel.text = "\(formattedDateTime)"

        opinionCard.opinionDescription.text = "Excellent fried chicken - very crispy and I love using the soup for dredging. The chicken was a bit tastless though, so next time I will be sure to add more spices."

        opinionCard2.dateLabel.text = "\(formattedDateTime)"
        opinionCard2.opinionDescription.text = "This is fantastic!!!!!!! Thank you. Will be a falimy favourite. A bit messy to prepare but worth it."

        addOpinionButton.title = "Add opinion"
    }
}
