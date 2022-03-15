//
//  File.swift
//
//
//  Created by Faustino Flores García on 22/2/22.
//

import Foundation

import UIKit

public final class StyleHelper {
    static var Shared: StyleHelper {
        StyleHelper()
    }

    // MARK: - STRUCT
    public struct TextAttributes {
        let font: UIFont?
        let color: UIColor?
        let cornerRadius: CGFloat?
        let backgroundColor: UIColor?
        let borderColor: UIColor?
        let borderWidth: CGFloat?
        let gradientColors: [UIColor]?
        let gradientHorizontal: Bool?
        let gradientLocations: [NSNumber]?
        let tintColor: UIColor?
        let icon: UIImage?
        //  let shadow: R.Shadow?

        init(font: UIFont? = nil, color: UIColor? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil,
             borderColor: UIColor? = nil, borderWidth: CGFloat? = nil, tintColor: UIColor? = nil,
             gradientColors: [UIColor]? = nil, gradientHorizontal: Bool = true, gradientLocations: [NSNumber]? = nil,
             icon: UIImage? = nil) // , shadow: R.Shadow? = nil)
        {
            self.font = font
            self.color = color
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
            self.borderColor = borderColor
            self.borderWidth = borderWidth

            self.gradientColors = gradientColors
            self.gradientHorizontal = gradientHorizontal
            self.gradientLocations = gradientLocations
            self.tintColor = tintColor
            self.icon = icon
           // self.shadow = shadow
        }
    }

    // MARK: - Control styles
    private func apply(attributes: TextAttributes, to label: UILabel) {
        label.font = attributes.font
        label.textColor = attributes.color
    }

    private func apply(attributes: TextAttributes, to textView: UITextView) {
        textView.font = attributes.font
        textView.textColor = attributes.color
    }

    private func apply(attributes: TextAttributes, to textField: UITextField) {
        textField.font = attributes.font
        textField.textColor = attributes.color
    }

    private func apply(attributes: TextAttributes, to button: UIButton) {
        button.setTitleColor(attributes.color, for: .normal)
        button.titleLabel?.font = attributes.font

        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center

        button.tintColor = attributes.tintColor
        button.layer.borderWidth = attributes.borderWidth ?? 0
        button.layer.borderColor = attributes.borderColor?.cgColor
        button.backgroundColor = attributes.backgroundColor
        if attributes.icon != nil {
            button.setImage(attributes.icon, for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        }
    }

    func apply(attributes: TextAttributes, to view: UIView) {
        if let l = view as? UILabel {
            apply(attributes: attributes, to: l)
        }

        if let t = view as? UITextView {
            apply(attributes: attributes, to: t)
        }

        if let f = view as? UITextField {
            apply(attributes: attributes, to: f)
        }

        if let b = view as? UIButton {
            apply(attributes: attributes, to: b)
        }

        if attributes.backgroundColor != nil {
            view.backgroundColor = attributes.backgroundColor
        }

        if attributes.gradientColors != nil {
            view.backgroundColor = nil

            let GradientLayerName = "gradientLayer"

            if let oldlayer = view.layer.sublayers?.filter({ $0.name == GradientLayerName }).first {
                oldlayer.removeFromSuperlayer()
            }

            let gradient = CAGradientLayer()
            gradient.masksToBounds = true
            gradient.frame = view.bounds
            gradient.colors = attributes.gradientColors?.map(\.cgColor)
            gradient.locations = attributes.gradientLocations

            if attributes.gradientHorizontal ?? true {
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
            } else {
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            }

            view.layer.insertSublayer(gradient, at: 0)
            view.clipsToBounds = true
        }

        apply(attributes: attributes, to: view.layer)
        
        if (attributes.cornerRadius != nil ) {
            view.clipsToBounds = true
        }

       /* if attributes.shadow != nil {
            attributes.shadow?.apply(to: view)
        }*/
    }

    private func apply(attributes: TextAttributes, to layer: CALayer) {
        if attributes.borderColor == nil {
            layer.borderColor = nil
            layer.borderWidth = 0
        } else {
            layer.borderColor = attributes.borderColor?.cgColor
            layer.borderWidth = attributes.borderWidth ?? 0
        }

        layer.cornerRadius = attributes.cornerRadius ?? 0
    }
}

extension UIView {
    func apply(style: R.Style) {
        StyleHelper.Shared.apply(attributes: style.value, to: self)
    }
}

extension UIButton {
    func apply(style: R.Style, andText text: String) {
        apply(style: style)
        setTitle(text, for: .normal)
    }
}

extension UILabel {
    func apply(style: R.Style, andText text: String) {
        apply(style: style)
        self.text = text
    }
}
