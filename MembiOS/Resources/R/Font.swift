//
//  File.swift
//
//
//  Created by Faustino Flores García on 22/2/22.
//

import UIKit

public extension R {
    enum Font: String, CaseIterable {
        case bold
        case regular

        var value: UIFont {
            customFont(withName: Theme.current?.fonts[self] ?? "", ofSize:
                Theme.current?.dimensions[R.Dimension.fontRegular] ?? 0)
        }

        func value(ofSize size: CGFloat) -> UIFont {
            customFont(withName: Theme.current?.fonts[self] ?? "", ofSize: size)
        }

        private func customFont(withName name: String, ofSize size: CGFloat) -> UIFont {
            let font = UIFont(name: name, size: size)
            return font ?? UIFont.systemFont(ofSize: size)
        }
    }
}
