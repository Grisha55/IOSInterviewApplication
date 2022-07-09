//
//  SettingsPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation

protocol SettingsPresenterProtocol: AnyObject {
    func logOut()
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    // Слабая ссылка на вьюху
    let view = SettingsVC()
    let firebaseService = FirebaseService()
    
    func logOut() {
        firebaseService.logOut()
    }
    
}
