//
//  LoginPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func loginButtonAction(email: String, password: String, completion: @escaping (Result<UserData, Error>) -> Void)
}

class LoginPresenter: LoginPresenterProtocol {
    
    // Слабая ссылка на вьюху
    private var view = LogInVC()
    
    var firebaseService: FirebaseServiceProtocol!
    
    func loginButtonAction(email: String, password: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        self.firebaseService.login(email: email, password: password) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let results):
                completion(.success(results))
            }
        }
    }
    
}
