//
//  LoginViewController.swift
//  Foodzilla
//
//  Created by Paweł on 28/03/2023.
//

import UIKit

final class LoginViewController: UIViewController, Storyboarded {

    @IBOutlet weak var usernameTextField: MainTextField!
    @IBOutlet weak var passwordTextField: MainTextField!
    @IBOutlet weak var signInButton: LandingButton!
    @IBOutlet var registerHereLabel: UILabel!
    
    var model: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tr = UITapGestureRecognizer(target: self, action: #selector(goToRegister))
        registerHereLabel.isUserInteractionEnabled = true
        registerHereLabel.addGestureRecognizer(tr)
    }

    override func loadView() {
        super.loadView()
        signInButton.title = "SIGN IN"
        usernameTextField.mainTextField.placeholder = "Username"
        passwordTextField.mainTextField.placeholder = "Password"
    }
    
    @objc
    private func goToRegister() {
        UIApplication.shared.sceneDelegate?.navigationController?.pushViewController( RegisterCoordinator.prepare(), animated: true)
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        model.login(user: User(username: usernameTextField.mainTextField.text!, password: passwordTextField.mainTextField.text!))
        
    }
}
