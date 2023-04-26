//
//  RegisterViewController.swift
//  Foodzilla
//
//  Created by Ania on 30/03/2023.
//

import UIKit

final class RegisterViewController: UIViewController {

    @IBOutlet weak var EmailTextField: MainTextField!
    @IBOutlet weak var FirstNameTextField: MainTextField!
    @IBOutlet weak var LastNameTextField: MainTextField!
    @IBOutlet weak var PasswordTextField: MainTextField!
    @IBOutlet weak var ConfirmPassTextField: MainTextField!
    @IBOutlet weak var registerButton: LandingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        registerButton.title = "REGISTER"
        EmailTextField.mainTextField.placeholder = "E-mail address"
        FirstNameTextField.mainTextField.placeholder = "First name"
        LastNameTextField.mainTextField.placeholder = "Last name"
        PasswordTextField.mainTextField.placeholder = "Password"
        ConfirmPassTextField.mainTextField.placeholder = "Confirm password"
    }
}
