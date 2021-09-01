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
    
    private let firebaseService = FirebaseService()
    
    override func loadView() {
        super.loadView()
        let logInView = LogInView()
        self.view = logInView
        logInView.logInViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}

extension LogInVC: LogInViewDelegate {
    
    func loginButtonAction(email: String, password: String) {
        self.firebaseService.login(email: email, password: password) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(_):
                let tabBarC = TabBarController()
                tabBarC.modalPresentationStyle = .fullScreen
                self.present(tabBarC, animated: true, completion: nil)
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
