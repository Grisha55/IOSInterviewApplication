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
        loginPresenter.loginButtonAction(email: email, password: password) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(_):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    let tabBarC = TabBarController()
                    tabBarC.modalPresentationStyle = .fullScreen
                    self.present(tabBarC, animated: true, completion: nil)
                }
            }
        }
    }
    
    func closeButtonAction() {
        let registrationVC = RegistrationVC()
        registrationVC.modalPresentationStyle = .fullScreen
        registrationVC.modalTransitionStyle = .coverVertical
        self.present(registrationVC, animated: true, completion: nil)
    }
}
