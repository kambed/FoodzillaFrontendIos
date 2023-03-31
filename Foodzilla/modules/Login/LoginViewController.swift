//
//  LoginViewController.swift
//  Foodzilla
//
//  Created by Paweł on 28/03/2023.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var SignInButton: LandingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        SignInButton.title = "SIGN IN"
    }
}
