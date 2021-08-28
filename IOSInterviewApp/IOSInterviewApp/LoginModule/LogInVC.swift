//
//  LogInVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

class LogInVC: UIViewController {

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
    
    func loginButtonAction() {
        let tabBarC = TabBarController()
        tabBarC.modalPresentationStyle = .fullScreen
        self.present(tabBarC, animated: true, completion: nil)
    }
    
    func closeButtonAction() {
        let registrationVC = RegistrationVC()
        registrationVC.modalPresentationStyle = .fullScreen
        registrationVC.modalTransitionStyle = .coverVertical
        self.present(registrationVC, animated: true, completion: nil)
    }
}
