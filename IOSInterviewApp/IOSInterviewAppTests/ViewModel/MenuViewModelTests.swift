//
//  MenuViewModelTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 02/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class MenuViewModelTests: XCTestCase {

    var sut: MenuViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = MenuViewModel()
        sut.router = Router(navigationController: UINavigationController(), assemblyBuilder: AssemblyBuilder())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRegistrationButtonPresentsMenuVC() {
        let questionVC = presentingQuestionVC()
        XCTAssertNotNil(questionVC.questionPresenter)
    }
    
    func testResultsButtonPresentsResultsVC() {
        let resultsVC = presentingResultVC()
        XCTAssertNotNil(resultsVC.resultsPresenter)
    }
    
    func presentingResultVC() -> ResultsVC {
        let resultsVC = ResultsVC()
        resultsVC.resultsPresenter = ResultsPresenter()
        return resultsVC
    }
    
    func presentingQuestionVC() -> QuestionVC {
        let questionVC = QuestionVC()
        questionVC.questionPresenter = QuestionPresenter()
        return questionVC
    }

}
