//
//  SettingsVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - Properties
    var settingsPresenter: SettingsPresenterProtocol!
    var settingsView: SettingsView!
    
    override func loadView() {
        super.loadView()
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
        self.settingsPresenter.logOut()
    }
}
