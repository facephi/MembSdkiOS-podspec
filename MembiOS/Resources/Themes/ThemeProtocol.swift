//
//  ThemeProtocol.swift
//  
//
//  Created by Faustino Flores García on 22/2/22.
//

import Foundation
import UIKit

public protocol ThemeProtocol {
    var name: String { get }
    var fonts: [R.Font: String] { get  }
    var dimensions: [R.Dimension: CGFloat] { get  }
    var styles: [R.Style: StyleHelper.TextAttributes] { get  }
    
    func setup()
    func setupFonts()
    func setupDimensions()
    func setupStyles()
}
