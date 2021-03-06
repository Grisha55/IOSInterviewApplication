//
//  LoginPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}

class LoginViewModel {
    
    let bag = DisposeBag()
    var firebaseService: FirebaseServiceProtocol!
    var router: RouterProtocol!
    var login: String?
    
    func transform(_ input: Input) -> Output {
        
        self.skipingAuthIfUserIs()
        
        input.validate
            .withLatestFrom(input.login)
            .drive(onNext: { [weak self] text in
                guard let self = self else { return }
                self.login = text
            }).disposed(by: bag)
        
        input.validate
            .withLatestFrom(input.password)
            .drive(onNext: { [weak self] text in
                guard let self = self else { return }
                self.firebaseService.login(email: self.login ?? "", password: text ?? "") { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(_):
                        self.router.menuViewController()
                    }
                }
            }).disposed(by: bag)
        
        input.close
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.router.registrationViewController()
            }).disposed(by: bag)
        
        return Output(shouldHideButton: isValid(login: input.login, password: input.password))
    }
    
    func isValid(login: Driver<String?>, password: Driver<String?>) -> Observable<Bool> {
        Observable.combineLatest(login.asObservable(), password.asObservable()).map({ (login, password) in
            guard let login = login, let password = password else { return false }
            return login.count > 5 && password.count > 5
        })
    }
    
    func skipingAuthIfUserIs() {
        if firebaseService.isAuthorized() {
            self.router.menuViewController()
        } else {
            return
        }
    }
    
}

extension LoginViewModel: ViewModelType {
    
    struct Input {
        let login: Driver<String?>
        let password: Driver<String?>
        let validate: Driver<Void>
        let close: Driver<Void>
    }

    struct Output {
        let shouldHideButton: Observable<Bool>
    }
    
}
