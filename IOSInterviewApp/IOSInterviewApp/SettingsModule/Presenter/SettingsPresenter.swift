//
//  SettingsPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import UIKit

protocol SettingsPresenterProtocol: AnyObject {
    func logOut()
    func darkModeToggleAction(_ toggle: UISwitch)
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    var firebaseService: FirebaseServiceProtocol!
    var router: RouterProtocol!
    
    func darkModeToggleAction(_ toggle: UISwitch) {
        if #available(iOS 13.0, *) {
            UserDefaults.standard.set(true, forKey: "darkModeIsOn")
            let appDelegate = UIApplication.shared.windows.first
            if toggle.isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            UserDefaults.standard.set(false, forKey: "darkModeIsOn")
            return
        }
    }
    
    func logOut() {
        firebaseService.logOut()
        router.popToRoot()
    }
    
}
