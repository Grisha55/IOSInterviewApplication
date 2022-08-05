//
//  AlertsFactory.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 05/08/2022.
//

import UIKit

enum Alerts {
    case wrongLoginEmail
    case wrongLoginPassword
    case wrongRegistrationLogin
    case wrongRegistrationPassword
}

protocol AlertsFactoryProtocol: AnyObject {
    func getAlert(by type: Alerts) -> UIViewController
}

class AlertsFactory: AlertsFactoryProtocol {
    
    func getAlert(by type: Alerts) -> UIViewController {
        switch type {
        case .wrongLoginEmail: return configureWrongLoginEmailAlert()
        case .wrongLoginPassword: return configureWrongLoginPasswordAlert()
        case .wrongRegistrationLogin: return configureWrongRegistrationEmailAlert()
        case .wrongRegistrationPassword: return configureWrongRegistrationPasswordAlert()
        }
    }
    
    private func configureWrongLoginEmailAlert() -> UIViewController {
        let alertController = UIAlertController(title: "Неверный email", message: "Проверьте правильность email", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ввести снова", style: .default)
        
        alertController.addAction(action)
        return alertController
    }
    
    private func configureWrongLoginPasswordAlert() -> UIViewController {
        let alertController = UIAlertController(title: "Неверный пароль", message: "Проверьте правильность пороля", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ввести снова", style: .default)
        
        alertController.addAction(action)
        return alertController
    }
    
    private func configureWrongRegistrationEmailAlert() -> UIViewController {
        let alertController = UIAlertController(title: "Неверный email", message: "Email должен иметь минимум 4 символа и включать (@, .)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ввести снова", style: .default)
        
        alertController.addAction(action)
        return alertController
    }
    
    private func configureWrongRegistrationPasswordAlert() -> UIViewController {
        let alertController = UIAlertController(title: "Неверный пароль", message: "Пароль должен иметь минимум 4 символа", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ввести снова", style: .default)
        
        alertController.addAction(action)
        return alertController
    }
    
}
