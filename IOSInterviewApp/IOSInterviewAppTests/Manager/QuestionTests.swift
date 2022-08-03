//
//  QuestionTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 03/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class QuestionTests: XCTestCase {
    
    var sut: Questions!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Questions()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testIfQuestionsFromTypesNotEqualZero() {
        XCTAssertNotEqual(sut.chooseQuestionsType(of: .swift).count, 0)
        XCTAssertNotEqual(sut.chooseQuestionsType(of: .network).count, 0)
        XCTAssertNotEqual(sut.chooseQuestionsType(of: .multithrading).count, 0)
        XCTAssertNotEqual(sut.chooseQuestionsType(of: .ui).count, 0)
        XCTAssertNotEqual(sut.chooseQuestionsType(of: .dataBase).count, 0)
        XCTAssertNotEqual(sut.chooseQuestionsType(of: .patterns).count, 0)
    }

}
