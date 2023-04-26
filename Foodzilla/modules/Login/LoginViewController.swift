//
//  LoginViewController.swift
//  Foodzilla
//
//  Created by Paweł on 28/03/2023.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var EmailTextField: MainTextField!
    @IBOutlet weak var PasswordTextField: MainTextField!
    @IBOutlet weak var SignInButton: LandingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        SignInButton.title = "SIGN IN"
        EmailTextField.mainTextField.placeholder = "E-mail address"
        PasswordTextField.mainTextField.placeholder = "Password"
    }
}
