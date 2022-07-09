//
//  SettingsVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

class SettingsVC: UIViewController {

    // MARK: - Properties
    
    private var settingsPresenter: SettingsPresenterProtocol!
    
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
        
        // Это будет перенесено в Assembly
        settingsPresenter = SettingsPresenter()
    }
    
}

extension SettingsVC: SettingsViewDelegate {
    
    func exitButtonAction() {
        self.settingsPresenter.logOut()
        let logInVC = LogInVC()
        logInVC.modalPresentationStyle = .fullScreen
        logInVC.modalTransitionStyle = .crossDissolve
        self.present(logInVC, animated: true, completion: nil)
    }
}
