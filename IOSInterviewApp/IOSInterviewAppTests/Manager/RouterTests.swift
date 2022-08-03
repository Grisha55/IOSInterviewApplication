//
//  RouterTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 03/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class RouterTests: XCTestCase {

    var sut: Router!
    var assemblyBuilder: AssemblyBuilder!
    var router: Router!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let navigationController = UINavigationController()
        assemblyBuilder = AssemblyBuilder()
        router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        sut = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLogInViewControllerNotNil() {
        
        let loginVC = assemblyBuilder?.createLoginModule(router: router) as! LogInVC
        XCTAssertNotNil(loginVC.loginViewModel)
    }
    
    func testRegistrationViewControllerNotNil() {
        
        let registrationVC = assemblyBuilder.createRegistrationModule(router: router) as! RegistrationVC
        XCTAssertNotNil(registrationVC.registrationViewModel)
    }
    
    func testMenuViewControllerNotNil() {
        
        let menuVC = assemblyBuilder?.createMenuModule(router: router) as! MenuVC
        XCTAssertNotNil(menuVC.menuViewModel)
    }
    
    func testSettingsViewControllerNotNil() {
        
        let settingsVC = assemblyBuilder?.createSettingsModule(router: router) as! SettingsVC
        XCTAssertNotNil(settingsVC.settingsPresenter)
    }
    
    func testCategoriesViewControllerNotNil() {
        
        let categoriesVC = assemblyBuilder?.createCategoriesModule(router: router) as! CategoriesVC
        XCTAssertNotNil(categoriesVC.categoriesPresenter)
    }
    
    func testQuestionsViewControllerNotNil(questionsType: QuestionsType) {
        
        let questionsVC = assemblyBuilder?.createQuestionsModule(questionsType: .patterns, router: router) as! QuestionVC
        XCTAssertNotNil(questionsVC.questionPresenter)
    }
    
    func testResultsViewControllerNotNil() {
        
        let resultsVC = assemblyBuilder?.createResultsModule(router: router) as! ResultsVC
        XCTAssertNotNil(resultsVC.resultsPresenter)
    }
    
}
