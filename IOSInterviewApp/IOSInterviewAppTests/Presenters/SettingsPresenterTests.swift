//
//  SettingsPresenterTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 03/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class SettingsPresenterTests: XCTestCase {

    var sut: SettingsPresenter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = SettingsPresenter()
        sut.router = Router(navigationController: UINavigationController(), assemblyBuilder: AssemblyBuilder())
        sut.firebaseService = FirebaseService()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedRouterNotNil() {
        XCTAssertNotNil(sut.router)
    }
    
    func testWhenViewIsLoadedFirebaseServiceNotNil() {
        XCTAssertNotNil(sut.firebaseService)
    }

}
