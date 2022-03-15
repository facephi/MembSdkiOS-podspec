//
//  Color.swift
//
//
//  Created by Faustino Flores García on 22/2/22.
//

import UIKit

extension R {
    enum Color: String {
        case primary
        case secondary
        case primaryBackground
        case secondaryBackground
        case terciary
        case terciaryBackground

        var value: UIColor {
            UIColor(named: "\(Theme.current?.name ?? "").\(rawValue)", in: Bundle.resourcesBundle, compatibleWith: nil) ?? UIColor.black
        }
    }
}
