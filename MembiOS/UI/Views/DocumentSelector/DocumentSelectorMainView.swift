//
//  DocumentSelectorMainView.swift
//  memb-ios-playground
//
//  Created by Faustino Flores García on 24/2/22.
//

import UIKit

protocol DocumentSelectorMainViewDelegate {
    func actionIntroViewTouchUpInside()
    func closeIntroViewTouchUpInside()
    func selectDocumentTouchUpInside()
}

class DocumentSelectorMainView: UIView {
    // MARK: - OUTLETS
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var actionButton: UIButton!
    @IBOutlet var headerView: HeaderView!
    @IBOutlet var documentSelectorView: DocumentSelectorSelectView!
    @IBOutlet var infoView: DocumentSelectorInfoView!

    // MARK: - VARS
    private var delegate: DocumentSelectorMainViewDelegate?

    // MARK: - FUNC
    func configuration(titleText: String, titleButton: String, delegate: DocumentSelectorMainViewDelegate?) {
        // TEXTS
        titleLabel.text = titleText
        actionButton.apply(style: R.Style.roundedButton, andText: titleButton)

        // STYLES
        backgroundColor = R.Color.primaryBackground.value
        titleLabel.apply(style: R.Style.title2)

        // SETUP
        self.delegate = delegate
        headerView.delegate = self

        documentSelectorView.delegate = self
    }

    func update(documentType: DocumentType) {
        documentSelectorView.update(documentType: documentType)
    }

    // MARK: - EVENTS
    @IBAction func actionTouchUpInside(_ sender: Any) {
        delegate?.actionIntroViewTouchUpInside()
    }
}

// MARK: - HeaderViewDelegate
extension DocumentSelectorMainView: HeaderViewDelegate {
    func closeTouchUpInside() {
        delegate?.closeIntroViewTouchUpInside()
    }
}

extension DocumentSelectorMainView: DocumentSelectorSelectViewDelegate {
    func actionSelectorTouchUpInside() {
        delegate?.selectDocumentTouchUpInside()
    }
}
