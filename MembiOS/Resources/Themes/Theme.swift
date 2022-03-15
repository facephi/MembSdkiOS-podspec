//
//  File.swift
//
//
//  Created by Faustino Flores García on 22/2/22.
//

import Foundation
import UIKit

public class Theme {
    // MARK: - STATIC
    static var current: ThemeProtocol?

    // MARK: - VARS
    public var name: String = ""
    public var fonts = [R.Font: String]()
    public var dimensions = [R.Dimension: CGFloat]()
    public var styles = [R.Style: StyleHelper.TextAttributes]()

    // MARK: - PUBLIC FUNC
    public static func setup(theme: ThemeProtocol) {
        registerFonts()

        Theme.current = theme
        Theme.current?.setupStyles()
    }

    // MARK: - PRIVATE FUNC
    private static func registerFonts() {
        registerFont(withExtension: "OTF")
        registerFont(withExtension: "otf")
        registerFont(withExtension: "TTF")
        registerFont(withExtension: "ttf")
    }

    private static func registerFont(withExtension ext: String) {
        let fonts = Bundle.resourcesBundle.urls(forResourcesWithExtension: ext, subdirectory: nil)
        fonts?.forEach { url in
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }
    }
}
