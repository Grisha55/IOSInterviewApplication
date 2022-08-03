//
//  CategoriesPresenterTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 02/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class CategoriesPresenterTests: XCTestCase {

    var sut: CategoriesPresenter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CategoriesPresenter()
        sut.router = Router(navigationController: UINavigationController(), assemblyBuilder: AssemblyBuilder())
        sut.questions = Questions()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testWhenViewIsLoadedRouterNotNil() {
        XCTAssertNotNil(sut.router)
    }
    
    func testWhenViewIsLoadedQuestionNotNil() {
        XCTAssertNotNil(sut.questions)
    }

    func testRouterPresentsDevicesVC() {
        let questionVC = presentingQuestionVC()
        XCTAssertNotNil(questionVC.circleImageView)
    }
    
    func testNumberOfModules() {
        XCTAssertEqual(sut.names.count, 6)
    }
    
    func presentingQuestionVC() -> QuestionVC {
        let questionVC = QuestionVC()
        questionVC.questionPresenter = QuestionPresenter()
        return questionVC
    }
    
    func testIfNumberOfQuestionsInModuleNetworkNotZero() {
        XCTAssertNotEqual(sut.countOfQuestions(name: "swift"), 0)
        XCTAssertNotEqual(sut.countOfQuestions(name: "network"), 0)
        XCTAssertNotEqual(sut.countOfQuestions(name: "multithrading"), 0)
        XCTAssertNotEqual(sut.countOfQuestions(name: "ui"), 0)
        XCTAssertNotEqual(sut.countOfQuestions(name: "dataBase"), 0)
        XCTAssertNotEqual(sut.countOfQuestions(name: "patterns"), 0)
    }

}
