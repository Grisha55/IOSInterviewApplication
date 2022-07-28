//
//  ThemeModel.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 27/07/2022.
//

import Foundation
import UIKit

struct Theme {
    let textColor: UIColor
    let backgroundColor: UIColor
    
    static let light = Theme(textColor: .white, backgroundColor: .purple)
    static let dark = Theme(textColor: .purple, backgroundColor: .black)
}
