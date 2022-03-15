//
//  FailureView.swift
//
//
//  Created by Faustino Flores García on 2/3/22.
//

import UIKit

protocol FailureViewDelegate {
    func actionFailureViewTouchUpInside()
}

@IBDesignable
class FailureView: UIView {
    // MARK: - OUTLET
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var actionButton: UIButton!
    @IBOutlet var backgroundView: UIImageView!
    @IBOutlet var logoView: UIImageView!

    // MARK: - VARS
    var delegate: FailureViewDelegate?

    // MARK: - FUNC
    func configuration(titleText: String, titleButton: String, delegate: FailureViewDelegate?) {
        // TEXTS
        titleLabel.text = titleText
        actionButton.apply(style: R.Style.roundedButton, andText: titleButton)

        // STYLES
        backgroundView.image = R.Image.failureBackground.value
        logoView.image = R.Image.closeBig.value

        backgroundColor = R.Color.primary.value
        titleLabel.apply(style: R.Style.title2White)

        // SETUP
        self.delegate = delegate
    }

    // MARK: - EVENTS
    @IBAction func actionTouchUpInside(_: Any) {
        delegate?.actionFailureViewTouchUpInside()
    }
}
