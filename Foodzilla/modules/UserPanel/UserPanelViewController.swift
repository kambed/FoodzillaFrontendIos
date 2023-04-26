//
//  UserPanelViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 23/04/2023.
//

import UIKit

final class UserPanelViewController: UIViewController {
    @IBOutlet weak var firstNameLabel: MainLabel!
    @IBOutlet weak var lastNameLabel: MainLabel!
    @IBOutlet weak var emailLabel: MainLabel!
    @IBOutlet weak var modifyButton: LandingButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!

    @IBOutlet weak var collectionView: UICollectionView!

    let model: UserPanelViewModel = UserPanelViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var tagsLabel: UILabel!

    override func loadView() {
        super.loadView()

        usernameLabel.text = "username"
        modifyButton.title = "MODIFY FILTERS"
        firstNameLabel.mainLabel.text = "User"
        lastNameLabel.mainLabel.text = "Name"
        emailLabel.mainLabel.text = "abc@gmail.com"

        tagsLabel.text = ""

        for (index, _) in model.tags.enumerated() {
            tagsLabel.font = FontFamily.SFProText.regular.font(size: 14)
            tagsLabel.text?.append("\(model.tags[index].name) ")

            if index != model.tags.count - 1 {
                tagsLabel.text?.append("| ")
            }
        }

        if tagsLabel.text?.hasSuffix("| ") == true {
            tagsLabel.text?.removeLast(2)
        }    }
}
