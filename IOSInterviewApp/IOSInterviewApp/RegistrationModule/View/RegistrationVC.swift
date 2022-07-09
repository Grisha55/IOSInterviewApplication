//
//  RegistrationVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

class RegistrationVC: UIViewController {
    
    // Properties
    var registrationPresenter: RegistrationPresenterProtocol!
    var registrationView: RegistrationView!
    
    override func loadView() {
        super.loadView()
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
        
        registrationPresenter.registerUser(name: name, email: email, password: password)
    }
}
