//
//  DiagnosisView.swift
//
//
//  Created by Jorge Poveda on 3/3/22.
//

import Foundation
import UIKit

protocol DiagnosisViewDelegate {
    func retryDiagnosisViewTouchUpInside()
}

class DiagnosisView: UIView {
    // MARK: - VARS
    private let diagnosisTypes = DiagnosisTypeValue.allValues()

    // MARK: - OUTLETS
    @IBOutlet var diagnosisLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var reasonLabel: UILabel!
    @IBOutlet var reasonDescriptionLabel: UILabel!
    @IBOutlet var retryButton: UIButton!
    @IBOutlet var modalView: UIView!

    var delegate: DiagnosisViewDelegate?

    func configuration(diagnosisTypeKey: DiagnosisTypeKey, delegate: DiagnosisViewDelegate?) {
        guard let diagnosisType = diagnosisTypes[diagnosisTypeKey] else { return }

        // SETUP
        self.delegate = delegate
        imageView.image = diagnosisType.image

        // STYLES
        backgroundColor = R.Color.primary.value
        modalView.apply(style: R.Style.roundedView)

        diagnosisLabel.apply(style: R.Style.regularSmallPlus, andText: R.Literal.Diagnosis.value.uppercased())
        reasonLabel.apply(style: R.Style.title2, andText: diagnosisType.title)
        reasonDescriptionLabel.apply(style: R.Style.regularSmallPlus, andText: diagnosisType.desc)
        retryButton.apply(style: R.Style.roundedButton, andText: diagnosisType.titleButton.uppercased())
    }

    @IBAction func retryTouchUpInside(_ sender: Any) {
        delegate?.retryDiagnosisViewTouchUpInside()
    }
}

