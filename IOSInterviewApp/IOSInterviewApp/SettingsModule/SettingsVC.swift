//
//  SettingsVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

class SettingsVC: UIViewController {

    override func loadView() {
        super.loadView()
        let settingsView = SettingsView()
        self.view = settingsView
        settingsView.settingsViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Настройки"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension SettingsVC: SettingsViewDelegate {
    
    func exitButtonAction() {
        let logInVC = LogInVC()
        logInVC.modalPresentationStyle = .fullScreen
        logInVC.modalTransitionStyle = .crossDissolve
        self.present(logInVC, animated: true, completion: nil)
    }
}
