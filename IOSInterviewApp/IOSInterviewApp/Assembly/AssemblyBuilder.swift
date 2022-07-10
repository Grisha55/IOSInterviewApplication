//
//  AssemblyBuilder.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    func createResultsModule(router: RouterProtocol) -> UIViewController
    func createQuestionsModule(questionsType: QuestionsType, router: RouterProtocol) -> UIViewController
    func createCategoriesModule(router: RouterProtocol) -> UIViewController
    func createSettingsModule(router: RouterProtocol) -> UIViewController
    func createMenuModule(router: RouterProtocol) -> UIViewController
    func createRegistrationModule(router: RouterProtocol) -> UIViewController
    func createLoginModule(router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createResultsModule(router: RouterProtocol) -> UIViewController {
        
        let vc = ResultsVC()
        let resultsPresenter = ResultsPresenter()
        
        vc.resultsPresenter = resultsPresenter
        resultsPresenter.router = router
        
        return vc
    }
    
    func createQuestionsModule(questionsType: QuestionsType, router: RouterProtocol) -> UIViewController {
        
        let vc = QuestionVC()
        let questionView = QuestionView()
        let questionPresenter = QuestionPresenter()
        
        vc.questionView = questionView
        vc.questionPresenter = questionPresenter
        questionPresenter.questionType = questionsType
        
        return vc
    }
    
    func createCategoriesModule(router: RouterProtocol) -> UIViewController {
        
        let vc = CategoriesVC()
        let categoriesPresenter = CategoriesPresenter()
        
        vc.categoriesPresenter = categoriesPresenter
        categoriesPresenter.router = router
        
        return vc
    }
    
    func createSettingsModule(router: RouterProtocol) -> UIViewController {
        
        let vc = SettingsVC()
        let settingsView = SettingsView()
        let settingsPresenter = SettingsPresenter()
        let firebaseService = FirebaseService()
        
        vc.settingsView = settingsView
        vc.settingsPresenter = settingsPresenter
        settingsPresenter.firebaseService = firebaseService
        settingsPresenter.router = router
        
        return vc
    }
    
    func createMenuModule(router: RouterProtocol) -> UIViewController {
        
        let vc = MenuVC()
        let menuView = MenuView()
        let menuPresenter = MenuPresenter()
        
        vc.menuView = menuView
        vc.menuPresenter = menuPresenter
        menuPresenter.router = router
        
        return vc
    }
    
    func createRegistrationModule(router: RouterProtocol) -> UIViewController {
        
        let vc = RegistrationVC()
        let registrationView = RegistrationView()
        let registrationPresenter = RegistrationPresenter()
        let firebaseService = FirebaseService()
        
        vc.registrationView = registrationView
        vc.registrationPresenter = registrationPresenter
        registrationPresenter.firebaseService = firebaseService
        registrationPresenter.router = router
        
        return vc
    }
    
    func createLoginModule(router: RouterProtocol) -> UIViewController {
        
        let vc = LogInVC()
        let loginView = LogInView()
        let loginPresenter = LoginPresenter()
        let firebaseService = FirebaseService()
        
        vc.logInView = loginView
        vc.loginPresenter = loginPresenter
        loginPresenter.firebaseService = firebaseService
        loginPresenter.router = router
        
        return vc
    }
}
