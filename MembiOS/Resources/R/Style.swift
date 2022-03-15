//
//  Style.swift
//
//
//  Created by Faustino Flores García on 22/2/22.
//

import Foundation

public extension R {
    enum Style {
        case roundedButton
        case roundedLabel
        case linkButton
        case barButton
        case title1
        case title2
        case title2White
        case title25
        case title25White
        case title3
        case title4
        case title5
        case regularBig
        case regular
        case regularTerciary
        case regularSmall
        case regularSmallPlus
        case regularSmallWhite
        case roundedView
        case roundedViewSecondary
        
        var value: StyleHelper.TextAttributes {
            return Theme.current?.styles[self] ?? StyleHelper.TextAttributes()
        }
    }
}
