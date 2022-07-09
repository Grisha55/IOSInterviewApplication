//
//  AssemblyBuilder.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    
    
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createResultsModule() -> UIViewController {
        
        let vc = ResultsVC()
        let resultsPresenter = ResultsPresenter()
        
        vc.resultsPresenter = resultsPresenter
        
        return vc
    }
    
    func createQuestionsModule() -> UIViewController {
        
        let vc = QuestionVC()
        let questionView = QuestionView()
        let questionPresenter = QuestionPresenter()
        
        vc.questionView = questionView
        vc.questionPresenter = questionPresenter
        
        return vc
    }
    
    func createCategoriesModule() -> UIViewController {
        
        let vc = CategoriesVC()
        
        return vc
    }
    
    func createSettingsModule() -> UIViewController {
        
        let vc = SettingsVC()
        let settingsView = SettingsView()
        let settingsPresenter = SettingsPresenter()
        let firebaseService = FirebaseService()
        
        vc.settingsView = settingsView
        vc.settingsPresenter = settingsPresenter
        settingsPresenter.firebaseService = firebaseService
        
        return vc
    }
    
    func createMenuModule() -> UIViewController {
        
        let vc = MenuVC()
        let menuView = MenuView()
        
        vc.menuView = menuView
        
        return vc
    }
    
    func createRegistrationModule() -> UIViewController {
        
        let vc = RegistrationVC()
        let registrationView = RegistrationView()
        let registrationPresenter = RegistrationPresenter()
        let firebaseService = FirebaseService()
        
        vc.registrationView = registrationView
        vc.registrationPresenter = registrationPresenter
        registrationPresenter.firebaseService = firebaseService
        
        return vc
    }
    
    func createLoginModule() -> UIViewController {
        
        let vc = LogInVC()
        let loginView = LogInView()
        let loginPresenter = LoginPresenter()
        let firebaseService = FirebaseService()
        
        vc.logInView = loginView
        vc.loginPresenter = loginPresenter
        loginPresenter.firebaseService = firebaseService
        
        return vc
    }
}
