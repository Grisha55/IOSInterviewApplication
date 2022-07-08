//
//  UserData.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 01.09.2021.
//

import Foundation

struct UserData: Codable {
    var uid: String = ""
    var name: String = ""
    var email: String = ""
    var password: String = ""
    
    enum CodingKeys: String, CodingKey {
        case uid
        case name
        case email
        case password
    }
}
