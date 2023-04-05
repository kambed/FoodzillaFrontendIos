//
//  RegisterViewController.swift
//  Foodzilla
//
//  Created by Ania on 30/03/2023.
//

import UIKit

final class RegisterViewController: UIViewController {

    @IBOutlet weak var registerButton: LandingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        registerButton.title = "REGISTER"
    }
}
