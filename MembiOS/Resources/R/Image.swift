//
//  Image.swift
//
//
//  Created by Faustino Flores García on 22/2/22.
//

import Foundation
import UIKit

extension R {
    enum Image: String {
        case imageNotFound
        case logo
        case close
        case closeDark
        case arrowDown
        case foreignCard
        case passport
        case idCard
        case flag
        case failureBackground
        case closeBig
        case globe
        case diagnosisPermissionDenied
        case diagnosisNetwork
        case diagnosisDefault
        case diagnosisTimeout

        var value: UIImage {
            UIImage(named: "\(Theme.current?.name ?? "").\(rawValue)", in: Bundle.resourcesBundle, with: nil) ?? UIImage()
        }
    }
}
