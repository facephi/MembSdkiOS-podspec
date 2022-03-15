//
//  StepView.swift
//  SelphID
//
//  Created by Mario Sevilla on 16/07/2020.
//  Copyright © 2020 FacePhi Beyond Biometrics. All rights reserved.
//

import Lottie
import UIKit

protocol StepViewDelegate {
    func actionIntroViewTouchUpInside()
    func closeIntroViewTouchUpInside()
}

class StepView: UIView, StepViewProtocol {
    // MARK: - OUTLETS
    @IBOutlet var stepCountLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var actionButton: UIButton!
    @IBOutlet var animationView: AnimationView?
    @IBOutlet var animationLeftConstraint: NSLayoutConstraint!
    @IBOutlet var animationRightConstraint: NSLayoutConstraint!
    @IBOutlet var headerView: HeaderView!
    
    var delegate: StepViewDelegate?
    
    func configuration(stepCountText: String, titleText: String, message: String, titleButton: String, animationName: String, customBackgroundColor: UIColor, animationPadding: CGFloat = 32, delegate: StepViewDelegate?) {
        guard let animation = Animation.named(animationName, bundle: Bundle.resourcesBundle) else { return }
        
        // TEXTS
        stepCountLabel.text = stepCountText
        titleLabel.text = titleText
        messageLabel.text = message
        
        // SETUP
        animationView?.animation = animation
        animationLeftConstraint.constant = animationPadding
        animationRightConstraint.constant = animationPadding

        actionButton.apply(style: R.Style.roundedButton, andText: titleButton)
        self.delegate = delegate
        
        headerView.delegate = self
        
        // STYLES
        stepCountLabel.apply(style: R.Style.title4)
        titleLabel.apply(style: R.Style.regularBig)
        messageLabel.apply(style: R.Style.regularTerciary)
        backgroundColor = customBackgroundColor
    }
    
    func playAnimation() {
        repeatAnimation()
    }
    
    // Fix: https://github.com/airbnb/lottie-ios/issues/1321
    private func repeatAnimation() {
        animationView?.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + (animationView?.animation?.duration ?? 10.0), execute: {
            self.repeatAnimation()
        })
    }
    
    @IBAction func actionTouchUpInside(_ sender: Any) {
        delegate?.actionIntroViewTouchUpInside()
    }
}

extension StepView: HeaderViewDelegate {
    func closeTouchUpInside() {
        delegate?.closeIntroViewTouchUpInside()
    }
}
