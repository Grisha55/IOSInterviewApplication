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

protocol LoginViewModelDelegate: AnyObject {
    func showWrongLoginAlert()
    func showWrongPasswordAlert()
}

class LoginViewModel {
    
    weak var delegate: LoginViewModelDelegate!
    let bag = DisposeBag()
    var firebaseService: FirebaseServiceProtocol!
    var router: RouterProtocol!
    var login: String?
    var timer: Timer?
    var customWaveView: CustomWaveView!
    let dr: TimeInterval = 10.0
    
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
                
                guard let login = self.login, login != "" else {
                    self.delegate.showWrongLoginAlert()
                    return
                }
                
                guard let password = text, password != "" else {
                    self.delegate.showWrongPasswordAlert()
                    return
                }
                
                self.firebaseService.login(email: login, password: password) { (result) in
                    switch result {
                    case .failure(let error):
                        if !login.contains("@") && !login.contains(".") {
                            self.delegate.showWrongPasswordAlert()
                        } else if password.count < 4 {
                            self.delegate.showWrongLoginAlert()
                        }
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
            return true
        })
    }
    
    func skipingAuthIfUserIs() {
        if firebaseService.isAuthorized() {
            self.router.menuViewController()
        } else {
            return
        }
    }
    
    func startCircleWaveAnimation(completion: @escaping () -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            let dr = CGFloat(1.0 / (self.dr / 0.01))
            
            self.customWaveView.progress += dr
            self.customWaveView.setupProgress(self.customWaveView.progress)
            
            if self.customWaveView.progress >= 0.95 {
                self.timer?.invalidate()
                self.timer = nil
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                    guard let self = self else { return }
                    self.customWaveView.percentAnimation()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    completion()
                }
            }
        })
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
