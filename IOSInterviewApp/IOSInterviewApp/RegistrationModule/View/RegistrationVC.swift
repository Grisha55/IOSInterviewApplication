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
        self.navigationItem.setHidesBackButton(true, animated: true)
    }


}

extension RegistrationVC: RegistrationViewDelegate {
    
    func topViewDidTapped() {
        self.registrationPresenter.closeButtonTapped()
    }
    
    func closeButtonAction() {
        self.registrationPresenter.closeButtonTapped()
    }
    
    func registerButtonAction(name: String, email: String, password: String) {
        
        registrationPresenter.registerUser(name: name, email: email, password: password)
    }
}
