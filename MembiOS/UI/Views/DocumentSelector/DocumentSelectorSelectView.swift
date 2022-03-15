//
//  DocumentSelectorSelectView.swift
//
//
//  Created by Faustino Flores García on 25/2/22.
//

import UIKit

protocol DocumentSelectorSelectViewDelegate {
    func actionSelectorTouchUpInside()
}

extension DocumentType {
    var image: UIImage {
        switch self {
        case .ID_CARD: return R.Image.idCard.value
        case .FOREIGN_CARD: return R.Image.foreignCard.value
        case .PASSPORT: return R.Image.passport.value
        }
    }

    var imageExtra: UIImage {
        switch self {
        case .ID_CARD, .FOREIGN_CARD: return R.Image.flag.value
        case .PASSPORT: return R.Image.globe.value
        }
    }
}

@IBDesignable
class DocumentSelectorSelectView: BaseView {
    // MARK: - OUTLETS
    @IBOutlet var backDocumentTypeView: UIView!
    @IBOutlet var titleDocumentType: UILabel!
    @IBOutlet var imageDocumentType: UIImageView!
    @IBOutlet var imageArrow: UIImageView!
    @IBOutlet var imageExtra: UIImageView!
    @IBOutlet var actionButton: UIButton!

    // MARK: - VARS
    var delegate: DocumentSelectorSelectViewDelegate?
    var documentType: DocumentType = .ID_CARD {
        didSet {
            titleDocumentType.text = documentType.text
            imageDocumentType.image = documentType.image
            imageExtra.image = documentType.imageExtra
        }
    }

    // MARK: - OVERRIDE
    override func setup() {
        super.setup()

        // IMAGES
        imageArrow.image = R.Image.arrowDown.value

        // STYLES
        backDocumentTypeView.apply(style: R.Style.roundedViewSecondary)
        actionButton.apply(style: R.Style.roundedView)
        titleDocumentType.apply(style: R.Style.title25)

        documentType = .ID_CARD
    }

    func update(documentType: DocumentType) {
        self.documentType = documentType
    }

    // MARK: - EVENTS
    @IBAction func actionTouchUpInside(_ sender: Any) {
        delegate?.actionSelectorTouchUpInside()
    }
}
