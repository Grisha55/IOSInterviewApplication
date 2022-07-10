//
//  LoginPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func loginButtonAction(email: String, password: String)
    func closeButtonTapped()
    func skipingAuthIfUserIs()
}

class LoginPresenter: LoginPresenterProtocol {
    
    private var view = LogInVC()
    
    var firebaseService: FirebaseServiceProtocol!
    var router: RouterProtocol!
    
    func skipingAuthIfUserIs() {
        if firebaseService.isAuthorized() {
            self.router.menuViewController()
        } else {
            return
        }
    }
    
    func loginButtonAction(email: String, password: String) {
        self.firebaseService.login(email: email, password: password) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(_):
                self.router.menuViewController()
            }
        }
    }
    
    func closeButtonTapped() {
        router.registrationViewController()
    }
    
}
