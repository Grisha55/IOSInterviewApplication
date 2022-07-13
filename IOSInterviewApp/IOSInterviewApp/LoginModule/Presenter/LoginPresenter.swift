//
//  LoginPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol LoginPresenterProtocol: AnyObject {
    var loginTextPublishSubject: PublishSubject<String> { get set }
    var passwordTextPublishSubject: PublishSubject<String> { get set }
    func loginButtonAction(email: String, password: String)
    func closeButtonTapped()
    func skipingAuthIfUserIs()
    func isValid() -> Observable<Bool>
}

class LoginPresenter: LoginPresenterProtocol {
    
    var loginTextPublishSubject = PublishSubject<String>()
    var passwordTextPublishSubject = PublishSubject<String>()
    
    private var view = LogInVC()
    
    var firebaseService: FirebaseServiceProtocol!
    var router: RouterProtocol!
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(loginTextPublishSubject.asObserver(), passwordTextPublishSubject.asObserver()).map { login, password in
            login.count > 5 && password.count > 5
        }
    }
    
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
