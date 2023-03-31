//
//  RegisterViewController.swift
//  Foodzilla
//
//  Created by Ania on 30/03/2023.
//

import UIKit

final class RegisterViewController: UIViewController {

    @IBOutlet weak var RegisterButton: LandingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        RegisterButton.title = "REGISTER"
    }
}
