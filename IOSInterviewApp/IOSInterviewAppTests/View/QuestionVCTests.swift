//
//  QuestionVCTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 02/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class QuestionVCTests: XCTestCase {

    var sut: QuestionVC!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = QuestionVC()
        sut.questionPresenter = QuestionPresenter()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedQuestionPresenterNotNil() {
        XCTAssertNotNil(sut.questionPresenter)
    }
    
    func testWhenViewIsLoadedQuestionAnswerViewNotNil() {
        XCTAssertNotNil(sut.answerTextView)
    }
    
    func testWhenViewIsLoadedShowAnswerButtonNotNil() {
        XCTAssertNotNil(sut.showAnswerButton)
    }
    
    func testWhenViewIsLoadedKnowButtonNotNil() {
        XCTAssertNotNil(sut.knowButton)
    }
    
    func testWhenViewIsLoadedUnKnownButtonNotNil() {
        XCTAssertNotNil(sut.unKnowButton)
    }
    
    func testWhenViewIsLoadedCircleImageViewNotNil() {
        XCTAssertNotNil(sut.circleImageView)
    }
    
    func testWhenViewIsLoadedFinishedResultLabelNotNil() {
        XCTAssertNotNil(sut.finishedResultLabel)
    }

}
