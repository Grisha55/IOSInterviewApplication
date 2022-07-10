//
//  Router.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation
import UIKit

protocol RouterProtocol: AnyObject {
    func logInViewController()
    func registrationViewController()
    func menuViewController()
    func settingsViewController()
    func categoriesViewController()
    func questionsViewController(questionsType: QuestionsType)
    func resultsViewController()
    func popToRoot()
}

class Router: RouterProtocol {
 
    private var navigationController: UINavigationController?
    private var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func logInViewController() {
        if let navigationController = navigationController {
            guard let loginVC = assemblyBuilder?.createLoginModule(router: self) else { return }
            navigationController.pushViewController(loginVC, animated: true)
        }
    }
    
    func registrationViewController() {
        if let navigationController = navigationController {
            guard let registrationVC = assemblyBuilder?.createRegistrationModule(router: self) else { return }
            navigationController.pushViewController(registrationVC, animated: true)
        }
    }
    
    func menuViewController() {
        if let navigationController = navigationController {
            guard let menuVC = assemblyBuilder?.createMenuModule(router: self) else { return }
            navigationController.pushViewController(menuVC, animated: true)
        }
    }
    
    func settingsViewController() {
        if let navigationController = navigationController {
            guard let settingsVC = assemblyBuilder?.createSettingsModule(router: self) else { return }
            navigationController.pushViewController(settingsVC, animated: true)
        }
    }
    
    func categoriesViewController() {
        if let navigationController = navigationController {
            guard let categoriesVC = assemblyBuilder?.createCategoriesModule(router: self) else { return }
            navigationController.pushViewController(categoriesVC, animated: true)
        }
    }
    
    func questionsViewController(questionsType: QuestionsType) {
        if let navigationController = navigationController {
            guard let questionsVC = assemblyBuilder?.createQuestionsModule(questionsType: questionsType, router: self) else { return }
            navigationController.pushViewController(questionsVC, animated: true)
        }
    }
    
    func resultsViewController() {
        if let navigationController = navigationController {
            guard let resultsVC = assemblyBuilder?.createResultsModule(router: self) else { return }
            navigationController.pushViewController(resultsVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
}
