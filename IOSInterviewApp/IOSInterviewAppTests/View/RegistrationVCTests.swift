//
//  RegistrationVCTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 01/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class RegistrationVCTests: XCTestCase {

    var sut: RegistrationVC!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = RegistrationVC()
        sut.registrationViewModel = RegistrationViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testWhenViewIsLoadedRegistrationViewModelNotNil() {
        XCTAssertNotNil(sut.registrationViewModel)
    }

    func testWhenViewIsLoadedRegistrationLabelNotNil() {
        XCTAssertNotNil(sut.registrationLabel)
    }
    
    func testWhenViewIsLoadedNameLabelNotNil() {
        XCTAssertNotNil(sut.nameLabel)
    }
    
    func testWhenViewIsLoadedNameTFNotNil() {
        XCTAssertNotNil(sut.nameTF)
    }
    
    func testWhenViewIsLoadedLoginLabelNotNil() {
        XCTAssertNotNil(sut.loginLabel)
    }
    
    func testWhenViewIsLoadedLoginTFNotNil() {
        XCTAssertNotNil(sut.loginTF)
    }
    
    func testWhenViewIsLoadedLoginViewNotNil() {
        XCTAssertNotNil(sut.loginView)
    }
    
    func testWhenViewIsLoadedPasswordLabelNotNil() {
        XCTAssertNotNil(sut.passwordLabel)
    }
    
    func testWhenViewIsLoadedPasswordTFNotNil() {
        XCTAssertNotNil(sut.passwordTF)
    }
    
    func testWhenViewIsLoadedPasswordViewNotNil() {
        XCTAssertNotNil(sut.passwordView)
    }
    
    func testWhenViewIsLoadedRegistrationButtonNotNil() {
        XCTAssertNotNil(sut.registrationButton)
    }
    
    func testWhenViewIsLoadedCloseButtonNotNil() {
        XCTAssertNotNil(sut.closeButton)
    }
    
    func testRegistrationButtonPresentsMenuVC() {
        let menuVC = presentingMenuVC()
        XCTAssertNotNil(menuVC.menuViewModel)
    }
    
    func presentingMenuVC() -> MenuVC {
        let menuVC = MenuVC()
        menuVC.menuViewModel = MenuViewModel()
        return menuVC
    }

}
