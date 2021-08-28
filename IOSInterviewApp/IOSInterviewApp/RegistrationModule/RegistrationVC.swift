//
//  RegistrationVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

class RegistrationVC: UIViewController {
    
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
    
    func registerButtonAction() {
        // TODO: Make transition to MenuVC
    }
}
