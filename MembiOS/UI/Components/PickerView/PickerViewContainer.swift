//
//  PickerViewContainer.swift
//  SelphID
//
//  Created by Antonio Llorens on 13/4/21.
//  Copyright © 2021 FacePhi Beyond Biometrics. All rights reserved.
//

import UIKit

protocol ToolBarDelegate: AnyObject {
    func didTapDone(tag: Int)
    func didTapCancel(tag: Int)
}

class PickerViewContainer: UIView {
    // MARK: - OUTLET
    @IBOutlet var toolBar: UIToolbar!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var cancelButton: UIBarButtonItem!
    @IBOutlet var doneButton: UIBarButtonItem!

    // MARK: - VARS
    public weak var toolbarDelegate: ToolBarDelegate?
    private var elementsArray = [String]()

    // MARK: - FUNCS
    func configure(toolbarDelegate: ToolBarDelegate, elementsArray: [String]) {
        self.elementsArray = elementsArray

        pickerView.backgroundColor = R.Color.secondaryBackground.value
        toolBar.backgroundColor = .white

        doneButton.customView = createCustomButton(withTitle: R.Literal.Done.value, andAction: #selector(doneTouchUpInside(_:)))

        cancelButton.customView = createCustomButton(withTitle: R.Literal.Cancel.value, andAction: #selector(cancelTouchUpInside(_:)))

        pickerView.tag = tag
        pickerView.delegate = self
        self.toolbarDelegate = toolbarDelegate

        isHidden = true
        layoutSubviews()
    }

    func selectPickerOption(withText text: String) {
        let row = elementsArray.firstIndex(of: text) ?? 0
        pickerView.selectRow(row, inComponent: 0, animated: false)
    }

    func show() {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut],
                       animations: {
                           self.frame.origin.y -= self.frame.height
                           self.layoutIfNeeded()
                       }, completion: nil)
        isHidden = false
    }

    func hide() {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut],
                       animations: {
                           self.center.y += self.frame.height
                           self.layoutIfNeeded()

                       }, completion: { (_: Bool) -> Void in
                           self.isHidden = true
                       })
    }

    func getSelectedElement() -> String {
        let row = pickerView.selectedRow(inComponent: 0)
        return elementsArray[row]
    }

    private func createCustomButton(withTitle title: String, andAction action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.apply(style: R.Style.barButton)
        button.addTarget(self, action: action, for: UIControl.Event.touchUpInside)

        return button
    }

    // MARK: - EVENTS
    @IBAction func cancelTouchUpInside(_ sender: Any) {
        toolbarDelegate?.didTapCancel(tag: tag)
    }

    @IBAction func doneTouchUpInside(_ sender: Any) {
        toolbarDelegate?.didTapDone(tag: tag)
    }
}

// MARK: - UIPickerViewDataSource
extension PickerViewContainer: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return elementsArray.count
    }
}

// MARK: - UIPickerViewDelegate
extension PickerViewContainer: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return elementsArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()
        label.apply(style: R.Style.title2)
        label.textAlignment = .center
        label.text = elementsArray[row]

        return label
    }
}
