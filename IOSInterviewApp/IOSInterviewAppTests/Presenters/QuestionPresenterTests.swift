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
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedRealmServiceNotNil() {
        XCTAssertNotNil(sut.realmService)
    }
    
    

}
