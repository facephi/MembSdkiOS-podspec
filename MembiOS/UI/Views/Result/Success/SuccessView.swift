//
//  SuccessView.swift
//
//
//  Created by Faustino Flores García on 3/3/22.
//

@_implementationOnly import NFCDocumentReader
import UIKit

protocol SuccessViewDelegate {
    func actionSuccessViewTouchUpInside()
}

@IBDesignable
class SuccessView: UIView {
    // MARK: - OUTLET
    @IBOutlet var titleLabel: UILabel!

    @IBOutlet var documentLabel: UILabel!

    @IBOutlet var resultView: UIView!
    @IBOutlet var resultTitleLabel: UILabel!
    @IBOutlet var resultTitleDesc: UILabel!

    @IBOutlet var dataView: UIView!
    @IBOutlet var dataTitleLabel: UILabel!

    @IBOutlet var nameDataView: ResultDataView!
    @IBOutlet var surnameDataView: ResultDataView!
    @IBOutlet var countryDataView: ResultDataView!
    @IBOutlet var docNumberDataView: ResultDataView!
    @IBOutlet var supportNumberDataView: ResultDataView!
    @IBOutlet var docTytpeDataView: ResultDataView!
    @IBOutlet var expirationDataView: ResultDataView!

    @IBOutlet var actionButton: UIButton!

    // MARK: - VARS
    var delegate: SuccessViewDelegate?

    // MARK: - FUNC
    func configuration(titleText: String, titleButton: String, nfcScanResponse: NfcDocumentModel, delegate: SuccessViewDelegate?) {
        // TEXTS
        titleLabel.text = titleText
        actionButton.apply(style: R.Style.roundedButton, andText: titleButton)

        documentLabel.text = Configuration.documentType.text

        resultTitleLabel.text = R.Literal.RegisterSuccess.value.uppercased()
        resultTitleDesc.text = R.Literal.ProcessCompleted.value

        dataTitleLabel.text = R.Literal.DataObtained.value.uppercased()

        // STYLES
        backgroundColor = R.Color.terciaryBackground.value
        titleLabel.apply(style: R.Style.title3)
        documentLabel.apply(style: R.Style.roundedLabel)

        resultView.apply(style: R.Style.roundedViewSecondary)
        resultTitleLabel.apply(style: R.Style.title25White)
        resultTitleDesc.apply(style: R.Style.regularSmallWhite)

        dataView.apply(style: R.Style.roundedView)
        dataTitleLabel.apply(style: R.Style.title5)

        showInfo(nfcScanResponse: nfcScanResponse)

        // SETUP
        self.delegate = delegate
    }

    private func showInfo(nfcScanResponse: NfcDocumentModel) {
        if let personalInformation = nfcScanResponse.nfcPersonalInformation, let documentInformation = nfcScanResponse.nfcDocumentInformation {
            let formattedExpirationDate = documentInformation.expirationDate?.parseDateAndFormat() ?? ""

            nameDataView.update(dataLabel: R.Literal.Name.value, dataText: personalInformation.name ?? "")
            surnameDataView.update(dataLabel: R.Literal.Surname.value, dataText: personalInformation.surname ?? "")
            countryDataView.update(dataLabel: R.Literal.DocumentCountry.value, dataText: documentInformation.issuer ?? "")
            docNumberDataView.update(dataLabel: R.Literal.DocumentNumber.value, dataText: personalInformation.personalNumber ?? "")
            supportNumberDataView.update(dataLabel: R.Literal.SupportNumber.value, dataText: documentInformation.documentNumber ?? "")

            docTytpeDataView.update(dataLabel: R.Literal.DocumentType.value, dataText: Configuration.documentType.text)
            expirationDataView.update(dataLabel: R.Literal.ExpirationDate.value, dataText: formattedExpirationDate)
        }
    }

    // MARK: - EVENTS
    @IBAction func actionTouchUpInside(_: Any) {
        delegate?.actionSuccessViewTouchUpInside()
    }
}
