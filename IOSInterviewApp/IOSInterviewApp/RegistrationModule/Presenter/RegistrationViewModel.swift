//
//  RegistrationViewModel.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol RegistrationViewModelDelegate: AnyObject {
    func showWrongRegistrationEmail()
    func showWrongRegistratioinPassword()
}

class RegistrationViewModel {
    
    private let bag = DisposeBag()
    var firebaseService: FirebaseServiceProtocol!
    var router: RouterProtocol!
    private var name: String?
    private var login: String?
    weak var delegate: RegistrationViewModelDelegate!
    
    func transform(_ input: Input) -> Output {
        input.validate
            .withLatestFrom(input.name)
            .drive(onNext: { [weak self] text in
                guard let self = self else { return }
                self.name = text
            }).disposed(by: bag)
        
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
                
                guard let name = self.name, let login = self.login else {
                    self.delegate.showWrongRegistrationEmail()
                    return
                }
                
                guard let password = text else {
                    self.delegate.showWrongRegistratioinPassword()
                    return
                }
                
                self.firebaseService.register(name: name, email: login, password: password) { (result) in
                    switch result {
                    case .failure(let error):
                        if !login.contains("@") || !login.contains(".") {
                            self.delegate.showWrongRegistrationEmail()
                        } else if password.count < 4 {
                            self.delegate.showWrongRegistratioinPassword()
                        }
                        print(error.localizedDescription)
                    case .success(_):
                        self.router.menuViewController()
                    }
                }
            }).disposed(by: bag)
        
        input.close
            .drive(onNext: { [weak self] in
                self?.router.popToRoot()
            }).disposed(by: bag)
        
        return Output(isValid: isValid(login: input.login, password: input.password))
    }
    
    func isValid(login: Driver<String?>, password: Driver<String?>) -> Observable<Bool> {
        Observable.combineLatest(login.asObservable(), password.asObservable()).map({ (login, password) in
            return true
        })
    }
    
}

extension RegistrationViewModel: ViewModelType {
    
    struct Input {
        let name: Driver<String?>
        let login: Driver<String?>
        let password: Driver<String?>
        let validate: Driver<Void>
        let close: Driver<Void>
    }
    
    struct Output {
        let isValid: Observable<Bool>
    }
    
}
