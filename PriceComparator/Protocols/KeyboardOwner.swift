//
//  KeyboardOwner.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 26/12/22.
//

import UIKit

protocol KeyboardOwner where Self: UIViewController {
    var activeTextField: UITextField? { get set }
}

extension KeyboardOwner {
    func activateHideKeyboardWhenTappedAroundBehavior() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func activateMoveViewUpWhenTextFieldIsCoveredByKeyboardBehavior(notificationCenter: NotificationCenterProtocol) {
        notificationCenter.addObserver(
            self,
            selector: #selector(moveViewToShowTextFieldIfNeeded),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(moveViewToOrigin),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}

fileprivate extension UIViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func moveViewToOrigin(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    @objc func moveViewToShowTextFieldIfNeeded(notification: NSNotification) {
        guard
            let keyboardOwnerSelf = self as? KeyboardOwner,
            let userInfo = notification.userInfo,
            let keyboardFrameEndUserInfoKey = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
            let activeTextField = keyboardOwnerSelf.activeTextField
        else {
            return
        }

        let keyboardSize = keyboardFrameEndUserInfoKey.cgRectValue

        let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: view).maxY
        
        let topOfKeyboard = view.frame.height - keyboardSize.height
        
        // if the bottom of Textfield is below the top of keyboard, move up
        if bottomOfTextField > topOfKeyboard {
            let spacingBetweenKeyboardAndTextField: CGFloat = 10

            view.frame.origin.y = topOfKeyboard - bottomOfTextField - spacingBetweenKeyboardAndTextField
        }
    }
}
