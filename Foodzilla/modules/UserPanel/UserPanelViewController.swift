//
//  UserPanelViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 23/04/2023.
//

import UIKit

final class UserPanelViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()

        avatarImage.layer.cornerRadius = 20.0
        usernameLabel.text = "username"
    }
}
