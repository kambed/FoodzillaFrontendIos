//
//  AlertManager.swift
//  Foodzilla
//
//  Created by Paweł on 27/05/2023.
//

import SwiftMessages

import UIKit

class AlertManager {
    
    private init() { }

    public static let shared: AlertManager = .init()
    
    func showError(message: String) {
        DispatchQueue.main.async {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.button?.isHidden = true
            view.configureDropShadow()
            view.configureContent(title: "Error", body: message, iconText: "🤔")
            view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
            SwiftMessages.show(view: view)
        }
    }
    
    func showSuccess(message: String) {
        DispatchQueue.main.async {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.success)
            view.button?.isHidden = true
            view.configureDropShadow()
            view.configureContent(title: "Success", body: message, iconText: "🥳")
            view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
            SwiftMessages.show(view: view)
        }
    }
}

