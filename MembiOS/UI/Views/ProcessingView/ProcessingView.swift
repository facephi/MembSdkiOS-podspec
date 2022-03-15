//
//  ProcessingView.swift
//
//
//  Created by Faustino Flores García on 1/3/22.
//

import UIKit

protocol ProcessingViewDelegate {
    func closeTouchUpInside()
}

class ProcessingView: UIView {
    // MARK: - OUTLETS
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var processingIndicator: UIActivityIndicatorView!

    // MARK: - VARS
    private var delegate: ProcessingViewDelegate?

    // MARK: - FUNC
    func configuration(titleText: String, delegate: ProcessingViewDelegate?) {
        // TEXTS
        titleLabel.text = titleText

        // STYLES
        backgroundColor = R.Color.terciaryBackground.value
        processingIndicator.color = R.Color.primary.value
        titleLabel.apply(style: R.Style.title2)
        closeButton.setImage(R.Image.closeDark.value, for: .normal)

        // SETUP
        self.delegate = delegate
    }

    // MARK: - EVENTS
    @IBAction func closeAction(_: Any) {
        delegate?.closeTouchUpInside()
    }
}
