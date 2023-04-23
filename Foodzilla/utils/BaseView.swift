//
//  BaseView.swift
//  Foodzilla
//
//  Created by Paweł on 12/04/2023.
//

import UIKit

public class BaseView: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }

    func setupNib() {
        guard let nibView = viewFromNibClass() else { return }
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(nibView)
        nibView.frame = self.bounds
        self.backgroundColor = .clear
    }

    func viewFromNibClass() -> UIView? {
        let className = self.className
        guard className != "BaseView" else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: className, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

public extension NSObjectProtocol {
    var className: String {
        return String(describing: type(of: self))
    }
}
