//
//  AssemblyBuilderTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 03/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class AssemblyBuilderTests: XCTestCase {

    var sut: AssemblyBuilder!
    var router: Router!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = AssemblyBuilder()
        router = Router(navigationController: UINavigationController(), assemblyBuilder: AssemblyBuilder())
    }

    override func tearDownWithError() throws {
        sut = nil
        router = nil
            
        try super.tearDownWithError()
    }

    func testIfCreateResultsModulePresentsResultsVC() {
        let resultsVC = createResultsModule(router: router) as! ResultsVC
        XCTAssertNotNil(resultsVC.resultsPresenter)
    }
    
    func testIfCreateQuestionsModulePresentsQuestionsVC() {
        let questionsVC = createQuestionsModule(questionsType: .patterns, router: router) as! QuestionVC
        XCTAssertNotNil(questionsVC.questionPresenter)
    }
    
    func testIfCreateCategoriesModulePresentsCategoriesVC() {
        let categoriesVC = createCategoriesModule(router: router) as! CategoriesVC
        XCTAssertNotNil(categoriesVC.categoriesPresenter)
    }
    
    func testIfCreateSettingsModulePresentsSettingsVC() {
        let settingsVC = createSettingsModule(router: router) as! SettingsVC
        XCTAssertNotNil(settingsVC.settingsPresenter)
    }
    
    func testIfCreateMenuModulePresentsMenuVC() {
        let menuVC = createMenuModule(router: router) as! MenuVC
        XCTAssertNotNil(menuVC.menuViewModel)
    }
    
    func testIfCreateRegistrationModulePresentsRegistrationVC() {
        let registrationVC = createRegistrationModule(router: router) as! RegistrationVC
        XCTAssertNotNil(registrationVC.registrationViewModel)
    }
    
    func testIfCreateLoginModulePresentsLoginVC() {
        let loginVC = createLoginModule(router: router) as! LogInVC
        XCTAssertNotNil(loginVC.loginViewModel)
    }
    
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
        
        return vc
    }

}
