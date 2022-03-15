//
//  Dimension.swift
//
//
//  Created by Faustino Flores García on 22/2/22.
//

import UIKit

public extension R {
    enum Dimension: CGFloat {
        case fontVerySmall
        case fontSmall
        case fontSmallPlus
        case fontRegular
        case fontRegularBig
        case fontQuasyBig
        case fontBig
        case fontBigPlus
        case fontBigPlusPlus
        case fontVeryBig

        case defaultBorder
        case defaulControlSize
        case cornerRadius
        case cornerRadiusBig

        var value: CGFloat {
            Theme.current?.dimensions[self] ?? 0
        }
    }
}
