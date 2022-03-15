//
//  HeaderView.swift
//
//
//  Created by Faustino Flores García on 23/2/22.
//

import UIKit

protocol HeaderViewDelegate {
    func closeTouchUpInside()
}

@IBDesignable
class HeaderView: BaseView {
    // MARK: - OUTLET
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var logoView: UIImageView!

    // MARK: - VARS
    var delegate: HeaderViewDelegate?

    // MARK: - OVERRIDE
    override func setup() {
        super.setup()

        backgroundColor = R.Color.primary.value
        logoView.image = R.Image.logo.value
        closeButton.setImage(R.Image.close.value, for: .normal)
    }

    // MARK: - EVENTS
    @IBAction func closeAction(_: Any) {
        delegate?.closeTouchUpInside()
    }
}
