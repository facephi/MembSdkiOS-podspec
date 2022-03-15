//
//  Animation.swift
//
//
//  Created by Faustino Flores García on 22/2/22.
//

import Foundation

extension R {
    enum Animation: String {
        case intro_mrz
        case intro_nfc
        case intro_selfie
        case read_nfc_error
        case read_nfc_intro
        case read_nfc_processing
        case read_nfc_success

        var value: String {
            rawValue
        }
    }
}
