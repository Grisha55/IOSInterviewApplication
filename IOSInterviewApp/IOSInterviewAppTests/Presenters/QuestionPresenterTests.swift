//
//  QuestionPresenterTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 02/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class QuestionPresenterTests: XCTestCase {

    var sut: QuestionPresenter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = QuestionPresenter()
        sut.realmService = RealmService()
        sut.questions = Questions()
        sut.questionView = QuestionVC()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedRealmServiceNotNil() {
        XCTAssertNotNil(sut.realmService)
    }
    
    func testWhenViewIsLoadedQuestionsNotNil() {
        XCTAssertNotNil(sut.questions)
    }
    
    func testIfNumberOfQuestionsNotEqualZero() {
        XCTAssertNotEqual(sut.questions.chooseQuestionsType(of: .network).count, 0)
        XCTAssertNotEqual(sut.questions.chooseQuestionsType(of: .swift).count, 0)
        XCTAssertNotEqual(sut.questions.chooseQuestionsType(of: .multithrading).count, 0)
        XCTAssertNotEqual(sut.questions.chooseQuestionsType(of: .ui).count, 0)
        XCTAssertNotEqual(sut.questions.chooseQuestionsType(of: .dataBase).count, 0)
        XCTAssertNotEqual(sut.questions.chooseQuestionsType(of: .patterns).count, 0)
    }
    
    func testIfHideButtonWorkingRight() {
        sut.questionView.answerTextView.isHidden = false
        XCTAssertEqual(sut.questionView.answerTextView.isHidden, false)
    }

    func testIfQuestionsDictCountNotEqualZero() {
        XCTAssertNotEqual(sut.questionsDict?.count, 0)
    }
    
}
