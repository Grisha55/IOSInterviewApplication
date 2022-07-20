//
//  Results.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 08/07/2022.
//

import Foundation
import RealmSwift

class Results: Object {
    @objc dynamic var moduleName: String = ""
    @objc dynamic var procents: Int = 0
}

class RealmResults: Object {
    
    @objc dynamic var moduleName: String = ""
    let results = List<Results>()
    
    override class func primaryKey() -> String? {
        return "moduleName"
    }
}
