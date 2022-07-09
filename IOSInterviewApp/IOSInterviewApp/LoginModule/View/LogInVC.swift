//
//  LogInVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit
import Firebase

class LogInVC: UIViewController {

    // MARK: - Properties
    var loginPresenter: LoginPresenterProtocol!
    var logInView: LogInView!
    
    override func loadView() {
        super.loadView()
        self.view = logInView
        logInView.logInViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
