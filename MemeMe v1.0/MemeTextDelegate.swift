//
//  MemeTextDelegate.swift
//  MemeMe v1.0
//
//  Created by Muhammad El-Badawy on 12/19/18.
//  Copyright © 2018 Muhammad El-Badawy. All rights reserved.
//

import Foundation
import UIKit

extension AddMemeViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
