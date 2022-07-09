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
    
    private let view = SettingsVC()
    var firebaseService: FirebaseServiceProtocol!
    
    func logOut() {
        firebaseService.logOut()
    }
    
}
