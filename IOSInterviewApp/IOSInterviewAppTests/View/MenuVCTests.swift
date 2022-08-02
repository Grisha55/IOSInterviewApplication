//
//  MenuVCTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 01/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class MenuVCTests: XCTestCase {

    var sut: MenuVC!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = MenuVC()
        sut.menuViewModel = MenuViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedMenuViewModelNotNil() {
        XCTAssertNotNil(sut.menuViewModel)
    }
    
    func testWhenViewIsLoadedCategoriesButtonNotNil() {
        XCTAssertNotNil(sut.categoriesButton)
    }
    
    func testWhenViewIsLoadedResultsButtonNotNil() {
        XCTAssertNotNil(sut.resultsButton)
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
