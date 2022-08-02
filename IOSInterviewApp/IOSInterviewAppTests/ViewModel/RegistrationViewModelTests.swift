//
//  RegistrationViewModelTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 01/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class RegistrationViewModelTests: XCTestCase {

    var sut: RegistrationViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = RegistrationViewModel()
        sut.firebaseService = FirebaseService()
        sut.router = Router(navigationController: UINavigationController(), assemblyBuilder: AssemblyBuilder())
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testIfFirebaseServiceNotNil() {
        XCTAssertNotNil(sut.firebaseService)
    }
    
    func testIfRouterIsNotNil() {
        XCTAssertNotNil(sut.router)
    }

}
