//
//  ThemeAena.swift
//
//
//  Created by Faustino Flores García on 22/2/22.
//

import UIKit

public class ThemeAena: Theme {
    override public init() {
        super.init()
        setup()
    }
}

extension ThemeAena: ThemeProtocol {
    public func setup() {
        name = "aena"

        setupFonts()
        setupDimensions()
    }

    public func setupFonts() {
        //    fonts[.bold] = "neo_sans_pro_bold"
        //    fonts[.regular] = "neo_sans_pro_regular"

        fonts[.bold] = "NeoSansPro-Bold"
        fonts[.regular] = "NeoSansPro-Regular"
    }

    public func setupDimensions() {
        dimensions[.fontVerySmall] = 12
        dimensions[.fontSmall] = 14
        dimensions[.fontSmallPlus] = 16
        dimensions[.fontRegular] = 18
        dimensions[.fontRegularBig] = 20
        dimensions[.fontQuasyBig] = 22
        dimensions[.fontBig] = 24
        dimensions[.fontBigPlus] = 26
        dimensions[.fontBigPlusPlus] = 28
        dimensions[.fontVeryBig] = 30
        dimensions[.defaultBorder] = 1
        dimensions[.defaulControlSize] = 44
        dimensions[.cornerRadius] = 14
        dimensions[.cornerRadiusBig] = 28
    }

    public func setupStyles() {
        styles[.roundedButton] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontRegular.value),
            color: R.Color.primary.value,
            backgroundColor: R.Color.secondary.value,
            cornerRadius: R.Dimension.cornerRadiusBig.value)

        styles[.roundedLabel] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontRegular.value),
            color: UIColor.white,
            backgroundColor: R.Color.primary.value,
            cornerRadius: R.Dimension.cornerRadius.value)

        styles[.title1] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontVeryBig.value),
            color: R.Color.primary.value)

        styles[.title2] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontBig.value),
            color: R.Color.primary.value)

        styles[.title2White] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontBig.value),
            color: UIColor.white)

        styles[.title25] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontRegularBig.value),
            color: R.Color.primary.value)

        styles[.title25White] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontRegularBig.value),
            color: UIColor.white)

        styles[.title3] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontRegular.value),
            color: R.Color.primary.value)

        styles[.title4] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontSmallPlus.value),
            color: R.Color.primary.value)

        styles[.title5] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontSmall.value),
            color: R.Color.primary.value)

        styles[.regularBig] = StyleHelper.TextAttributes(
            font: R.Font.regular.value(ofSize: R.Dimension.fontBig.value),
            color: R.Color.primary.value)

        styles[.regular] = StyleHelper.TextAttributes(
            font: R.Font.regular.value(ofSize: R.Dimension.fontRegular.value),
            color: R.Color.primary.value)

        styles[.regularTerciary] = StyleHelper.TextAttributes(
            font: R.Font.regular.value(ofSize: R.Dimension.fontRegular.value),
            color: R.Color.terciary.value)

        styles[.regularSmall] = StyleHelper.TextAttributes(
            font: R.Font.regular.value(ofSize: R.Dimension.fontVerySmall.value),
            color: R.Color.primary.value)

        styles[.regularSmallPlus] = StyleHelper.TextAttributes(
            font: R.Font.regular.value(ofSize: R.Dimension.fontSmallPlus.value),
            color: R.Color.primary.value)

        styles[.regularSmallWhite] = StyleHelper.TextAttributes(
            font: R.Font.regular.value(ofSize: R.Dimension.fontSmall.value),
            color: UIColor.white)

        styles[.linkButton] = StyleHelper.TextAttributes(
            font: R.Font.regular.value(ofSize: R.Dimension.fontVerySmall.value),
            color: R.Color.secondary.value)

        styles[.barButton] = StyleHelper.TextAttributes(
            font: R.Font.bold.value(ofSize: R.Dimension.fontRegular.value),
            color: R.Color.secondary.value)

        styles[.roundedView] = StyleHelper.TextAttributes(
            backgroundColor: UIColor.white,
            cornerRadius: R.Dimension.cornerRadius.value)

        styles[.roundedViewSecondary] = StyleHelper.TextAttributes(
            backgroundColor: R.Color.secondary.value,
            cornerRadius: R.Dimension.cornerRadius.value)
    }
}
