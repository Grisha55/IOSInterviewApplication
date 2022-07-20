//
//  RealmService.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 20/07/2022.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol: AnyObject {
    func savingDataIntoRealm(result: Results, module: String)
}

class RealmService: RealmServiceProtocol {
    
    func savingDataIntoRealm(result: Results, module: String) {
        do {
            let realm = try Realm()
            
            realm.beginWrite()
            
            realm.add(result)
            
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
}
