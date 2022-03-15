//
//  ResultDataView.swift
//
//
//  Created by Faustino Flores García on 3/3/22.
//

import UIKit

@IBDesignable
class ResultDataView: BaseView {
    // MARK: - OUTLET
    @IBOutlet var dataLabel: UILabel!
    @IBOutlet var dataText: UILabel!
    @IBOutlet var separatorView: UIView!

    // MARK: - OVERRIDE
    override func setup() {
        super.setup()

        dataLabel.apply(style: R.Style.regularSmallPlus)
        dataText.apply(style: R.Style.title4)
        separatorView.backgroundColor = R.Color.primary.value
    }

    // MARK: - FUNC
    func update(dataLabel: String, dataText: String) {
        self.dataLabel.text = dataLabel
        self.dataText.text = dataText
    }
}
