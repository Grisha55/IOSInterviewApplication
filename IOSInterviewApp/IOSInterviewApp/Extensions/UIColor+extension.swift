//
//  UIColor+extension.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 27/07/2022.
//

import UIKit

extension UIColor {
    
    static func setColor(lightColor: UIColor, darkColor: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection) -> UIColor in
                return traitCollection.userInterfaceStyle == .light ? lightColor : darkColor
            }
        } else {
            return lightColor
        }
    }
    
}
