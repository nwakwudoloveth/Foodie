//
//  File.swift
//  Foodie
//
//  Created by Loveth Nwakwudo on 12/31/21.
//


import UIKit


//TO CHANGE THE BUTTON

extension UIView {
   @IBInspectable var cornerRadius:CGFloat{
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
