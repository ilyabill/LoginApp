//
//  CustomTextField.swift
//  LoginApp
//
//  Created by ILYA BILARUS on 16.12.2021.
//

import UIKit

class CustomTextField: UITextField {

    override public var hasText: Bool {
        get {

            if let length = text?.count {
                if length >= 4 {
                    return true
                }
                
            }
            return false
        }
    }
}
