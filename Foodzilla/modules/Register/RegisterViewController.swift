//
//  RegisterViewController.swift
//  Foodzilla
//
//  Created by Ania on 30/03/2023.
//

import UIKit
import Combine

final class RegisterViewController: UIViewController, Storyboarded {

    @IBOutlet weak var usernameTextField: MainTextField!
    @IBOutlet weak var firstNameTextField: MainTextField!
    @IBOutlet weak var lastNameTextField: MainTextField!
    @IBOutlet weak var passwordTextField: MainTextField!
    @IBOutlet weak var confirmPassTextField: MainTextField!
    @IBOutlet weak var registerButton: LandingButton!
    
    var model: RegisterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        registerButton.title = "REGISTER"
        usernameTextField.mainTextField.placeholder = "Username"
        firstNameTextField.mainTextField.placeholder = "First name"
        lastNameTextField.mainTextField.placeholder = "Last name"
        passwordTextField.mainTextField.placeholder = "Password"
        confirmPassTextField.mainTextField.placeholder = "Confirm password"
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        model.register(user: User(firstName: firstNameTextField.mainTextField.text!, lastName: lastNameTextField.mainTextField.text!, username: usernameTextField.mainTextField.text!, password: passwordTextField.mainTextField.text!), confirmPassword: confirmPassTextField.mainTextField.text!)
    }
}
