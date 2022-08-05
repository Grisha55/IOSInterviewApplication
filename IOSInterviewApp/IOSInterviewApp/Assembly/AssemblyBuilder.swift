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
        resultsPresenter.realmService = RealmService()
        
        return vc
    }
    
    func createQuestionsModule(questionsType: QuestionsType, router: RouterProtocol) -> UIViewController {
        
        let vc = QuestionVC()
        let questionPresenter = QuestionPresenter()
        let questions = Questions()
        
        vc.questionPresenter = questionPresenter
        questionPresenter.questionView = vc
        questionPresenter.questions = questions
        questionPresenter.realmService = RealmService()
        questionPresenter.questionType = questionsType
        
        return vc
    }
    
    func createCategoriesModule(router: RouterProtocol) -> UIViewController {
        
        let vc = CategoriesVC()
        let categoriesPresenter = CategoriesPresenter()
        let questions = Questions()
        
        vc.categoriesPresenter = categoriesPresenter
        categoriesPresenter.router = router
        categoriesPresenter.questions = questions
        
        return vc
    }
    
    func createSettingsModule(router: RouterProtocol) -> UIViewController {
        
        let vc = SettingsVC()
        let settingsPresenter = SettingsPresenter()
        let firebaseService = FirebaseService()
        
        vc.settingsPresenter = settingsPresenter
        settingsPresenter.firebaseService = firebaseService
        settingsPresenter.router = router
        
        return vc
    }
    
    func createMenuModule(router: RouterProtocol) -> UIViewController {
        
        let vc = MenuVC()
        let menuViewModel = MenuViewModel()
        
        vc.menuViewModel = menuViewModel
        menuViewModel.router = router
        
        return vc
    }
    
    func createRegistrationModule(router: RouterProtocol) -> UIViewController {
        
        let vc = RegistrationVC()
        let registrationViewModel = RegistrationViewModel()
        let firebaseService = FirebaseService()
        
        vc.registrationViewModel = registrationViewModel
        registrationViewModel.firebaseService = firebaseService
        registrationViewModel.router = router
        
        return vc
    }
    
    func createLoginModule(router: RouterProtocol) -> UIViewController {
        
        let vc = LogInVC()
        let loginViewModel = LoginViewModel()
        let firebaseService = FirebaseService()
        let customWaveView = CustomWaveView()
        
        vc.loginViewModel = loginViewModel
        vc.customWaveView = customWaveView
        loginViewModel.firebaseService = firebaseService
        loginViewModel.router = router
        loginViewModel.customWaveView = customWaveView
        
        return vc
    }
}
