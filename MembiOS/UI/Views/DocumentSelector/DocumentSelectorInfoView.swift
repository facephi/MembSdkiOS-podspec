//
//  DocumentSelectorInfoView.swift
//
//  Created by Faustino Flores García on 25/2/22.
//

import UIKit

protocol DocumentSelectorInfoViewDelegate {
    func actionInfoViewTouchUpInside()
}

@IBDesignable
class DocumentSelectorInfoView: BaseView {
    // MARK: - OUTLETS
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var actionButton: UIButton!

    // MARK: - VARS
    var delegate: DocumentSelectorInfoViewDelegate?

    // MARK: - OVERRIDE
    override func setup() {
        super.setup()

        // TEXTS
        titleLabel.text = R.Literal.WelcomeInfoText.value
        actionButton.apply(style: R.Style.linkButton, andText: R.Literal.WelcomeInfoLink.value)

        // STYLES
        apply(style: R.Style.roundedView)
        titleLabel.apply(style: R.Style.regularSmall)
    }

    // MARK: - EVENTS
    @IBAction func actionTouchUpInside(_ sender: Any) {
        delegate?.actionInfoViewTouchUpInside()
    }
}
