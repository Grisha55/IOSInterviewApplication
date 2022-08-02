//
//  LoginViewModelTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 01/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class LoginViewModelTests: XCTestCase {

    var sut: LoginViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = LoginViewModel()
        sut.firebaseService = FirebaseService()
        sut.router = Router(navigationController: UINavigationController(), assemblyBuilder: AssemblyBuilder())
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedFirebaseManagerNotNil() {
        XCTAssertNotNil(sut.firebaseService)
    }
    
    func testWhenViewIsLoadedRouterNotNil() {
        XCTAssertNotNil(sut.router)
    }
    
    func testSomeActivity() {
        XCTAssertFalse(sut.firebaseService.isAuthorized())
    }

}
