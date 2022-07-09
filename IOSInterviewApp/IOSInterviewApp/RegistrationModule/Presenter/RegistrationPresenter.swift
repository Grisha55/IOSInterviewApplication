//
//  RegistrationPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation

protocol RegistrationPresenterProtocol: AnyObject {
    func registerUser(name: String, email: String, password: String)
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    
    var firebaseService: FirebaseServiceProtocol!
    var view = RegistrationVC()
    
    func registerUser(name: String, email: String, password: String) {
        
        self.firebaseService.register(name: name, email: email, password: password) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(_):
                let tabBarC = TabBarController()
                tabBarC.modalPresentationStyle = .fullScreen
                self.view.present(tabBarC, animated: true, completion: nil)
            }
        }
        
    }
    
}
