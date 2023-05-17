//
//  LoginViewController.swift
//  Foodzilla
//
//  Created by Paweł on 28/03/2023.
//

import UIKit

final class LoginViewController: UIViewController, Storyboarded {

    @IBOutlet weak var EmailTextField: MainTextField!
    @IBOutlet weak var PasswordTextField: MainTextField!
    @IBOutlet weak var SignInButton: LandingButton!
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
        SignInButton.title = "SIGN IN"
        EmailTextField.mainTextField.placeholder = "E-mail address"
        PasswordTextField.mainTextField.placeholder = "Password"
    }
    
    @objc
    private func goToRegister() {
        UIApplication.shared.sceneDelegate?.navigationController?.pushViewController( RegisterCoordinator.prepare(), animated: true)
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        UIApplication.shared.sceneDelegate?.changeRootViewController(viewController: ContainerCoordinator.prepare())
        
    }
}
