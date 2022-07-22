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
    func deleteAllResultsFromRealm()
}

class RealmService: RealmServiceProtocol {
    
    func deleteAllResultsFromRealm() {
        do {
            let realm = try Realm()
            realm.beginWrite()
            
            realm.deleteAll()
            
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
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
