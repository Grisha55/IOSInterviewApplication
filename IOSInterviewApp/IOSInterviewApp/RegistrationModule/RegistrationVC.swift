//
//  RegistrationVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

class RegistrationVC: UIViewController {
    
    // Properties
    
    private let firebaseService = FirebaseService()
    
    override func loadView() {
        super.loadView()
        
        let registrationView = RegistrationView()
        self.view = registrationView
        registrationView.registrationViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }


}

extension RegistrationVC: RegistrationViewDelegate {
    
    func closeButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func registerButtonAction(name: String, email: String, password: String) {
        
        self.firebaseService.register(name: name, email: email, password: password) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(_):
                let tabBarC = TabBarController()
                tabBarC.modalPresentationStyle = .fullScreen
                self.present(tabBarC, animated: true, completion: nil)
            }
        }
    }
}
