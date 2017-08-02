//
//  CustomButton.swift
//  Calculator
//
//  Created by David Para on 7/25/17.
//  Copyright © 2017 Udemy_ParaD. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    public var textAlignment: NSTextAlignment = .center
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }

}
