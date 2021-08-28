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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }


}

