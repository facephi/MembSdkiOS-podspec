//
//  DiagnosisType.swift
//
//
//  Created by Faustino Flores García on 8/3/22.
//

import UIKit

enum DiagnosisTypeKey {
    case DEFAULT_ERROR
    case TIMEOUT
    case CAMERA_PERMISION_DENIED
    case NETWORK_CONNECTION_TYPE
}

struct DiagnosisTypeValue {
    let title: String
    let desc: String
    let titleButton: String
    let image: UIImage
}

extension DiagnosisTypeValue {
    static let allValues = {
        [DiagnosisTypeKey.DEFAULT_ERROR: DiagnosisTypeValue(title: R.Literal.DiagnosisDefaultErrorTitle.value,
                                                            desc: R.Literal.DiagnosisDefaultErrorDesc.value,
                                                            titleButton: R.Literal.OkUnderstood.value,
                                                            image: R.Image.diagnosisDefault.value),
         DiagnosisTypeKey.TIMEOUT: DiagnosisTypeValue(title: R.Literal.DiagnosisTimeoutTitle.value,
                                                      desc: R.Literal.DiagnosisTimeoutDesc.value,
                                                      titleButton: R.Literal.TryAgain.value,
                                                      image: R.Image.diagnosisTimeout.value),
         DiagnosisTypeKey.CAMERA_PERMISION_DENIED: DiagnosisTypeValue(title: R.Literal.DiagnosisPermisionDeniedTitle.value,
                                                                      desc: R.Literal.DiagnosisPermisionDeniedDesc.value,
                                                                      titleButton: R.Literal.OkUnderstood.value,
                                                                      image: R.Image.diagnosisPermissionDenied.value),
         DiagnosisTypeKey.NETWORK_CONNECTION_TYPE: DiagnosisTypeValue(title: R.Literal.DiagnosisNetworkErrorTitle.value,
                                                                      desc: R.Literal.DiagnosisNetworkErrorDesc.value,
                                                                      titleButton: R.Literal.Close.value,
                                                                      image: R.Image.diagnosisNetwork.value),
        ]
    }
}
