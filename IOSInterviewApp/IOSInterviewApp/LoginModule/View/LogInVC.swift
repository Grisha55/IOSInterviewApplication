//
//  LogInVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class LogInVC: UIViewController {

    // MARK: - Properties
    let disposeBag = DisposeBag()
    var loginPresenter: LoginPresenterProtocol!
    var logInView: LogInView!
    
    override func loadView() {
        super.loadView()
        self.view = logInView
        logInView.logInViewDelegate = self
        loginPresenter.skipingAuthIfUserIs()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindingForFields()
    }
    
    private func bindingForFields() {
        logInView.loginTF.rx.text.map { $0 ?? "" }.bind(to: loginPresenter.loginTextPublishSubject).disposed(by: disposeBag)
        
        logInView.passwordTF.rx.text.map { $0 ?? "" }.bind(to: loginPresenter.passwordTextPublishSubject).disposed(by: disposeBag)
        
        loginPresenter.isValid().bind(to: logInView.loginButton.rx.isEnabled).disposed(by: disposeBag)
        
        loginPresenter.isValid().map { $0 ? 1 : 0.1 }.bind(to: logInView.loginButton.rx.alpha).disposed(by: disposeBag)
    }
    
}

extension LogInVC: LogInViewDelegate {
    
    func loginButtonAction(email: String, password: String) {
        self.loginPresenter.loginButtonAction(email: email, password: password)
    }
    
    func closeButtonAction() {
        self.loginPresenter.closeButtonTapped()
    }
}
