//
//  Literal.swift
//
//
//  Created by Faustino Flores García on 23/2/22.
//

extension R {
    enum Literal: String {
        case Understood
        case LookForABackgroundWithGoodContrast = "Look for a background with high contrast and place the document inside the box"
        case DocumentReading = "Document reading"
        case StepXY = "Step {0} of {1}"
        case Cancel
        case Done
        case YesFinish = "Yes, finish"
        case FinishProcess = "Finish the process"
        case AreSureFinishProcess = "Are you sure you want to finish the process?"
        case Ok
        case NFC
        case YouMustPutYourMobileGluedToTheChipOfYourDocument = "You must put your mobile glued to the chip of your document"
        case ScanChip = "Scan chip"
        case Selfie
        case TakeASelfie = "Take a selfie"
        case TakeSelfie = "Take selfie"
        case WelcomeInfoText = "NFC-enabled documents are:\nDNI 3.0, 4.0, NIE and Passport after 2015."
        case WelcomeInfoLink = "How to recognize them?"
        case WelcomeInfoTitle = "You must have:"
        case WelcomeButton = "Ready"
        case IdCard = "Id card"
        case Passport
        case ForeignCard = "Foreign Card"
        case DrivingLicense = "Driving license"
        case ProcessingDocument = "Processing document"
        case ProcessFailed = "Process failed!"
        case Finalize
        case BringYourDeviceCloserToTheDocument = "Bring your device closer to the document"
        case NFCReadSuccessfully = "NFC read successfully"
        case NFCHasNotCouldBeRead = "NFC has not could be read"
        case PleaseEnableNFCToContinue = "Please enable NFC to continue"
        case ErrorInvalidMRZKey = "An error happened while trying to retrieve the document's data"
        case Results
        case RegisterSuccess = "Register success"
        case ProcessCompleted = "Congratulations! The process has been completed"
        case DataObtained = "Data obtained"
        case Name
        case Surname
        case DocumentCountry = "Document country"
        case DocumentNumber = "Document number"
        case SupportNumber = "Support number"
        case DocumentType = "Document type"
        case ExpirationDate = "Expiration date"
        case Diagnosis = "Diagnostic"
        case DiagnosisTimeoutTitle = "Timeout"
        case DiagnosisTimeoutDesc = "You have exceeded the access time. Try again faster"
        case DiagnosisPermisionDeniedTitle = "Permission denied"
        case DiagnosisPermisionDeniedDesc = "You need to allow camera permission to continue"
        case DiagnosisDefaultErrorTitle = "Ups!"
        case DiagnosisDefaultErrorDesc = "We have detected a problem. \nPlease try again"
        case DiagnosisNetworkErrorTitle = "Connection error"
        case DiagnosisNetworkErrorDesc = "We have detected a problem on your internet connection so you can\'t continue with the process."
        case TryAgain = "Try again"
        case OkUnderstood = "Ok, understood"
        case Close

        var value: String {
            rawValue.localized
        }
    }
}
