//
//  LoginViewModelTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 01/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class LoginViewModelTests: XCTestCase {

    var sut: LogInVC!
    var loginViewModel: LoginViewModel!
    var registrationVC: RegistrationVC!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = LogInVC()
        loginViewModel = LoginViewModel()
        registrationVC = RegistrationVC()
        let customWaveView = CustomWaveView()
        let firebaseService = FirebaseService()
        
        sut.loginViewModel = loginViewModel
        sut.customWaveView = customWaveView
        loginViewModel.firebaseService = firebaseService
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        loginViewModel = nil
        registrationVC = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedLoginViewModelNotNil() {
        XCTAssertNotNil(sut.loginViewModel)
    }
    
    func testWhenViewIsLoadedLoginTFNotNil() {
        XCTAssertNotNil(sut.loginTF)
    }
    
    func testWhenViewIsLoadedLoginLabelNotNil() {
        XCTAssertNotNil(sut.loginLabel)
    }
    
    func testWhenViewIsLoadedPasswordLabelNotNil() {
        XCTAssertNotNil(sut.passwordLabel)
    }
    
    func testWhenViewIsLoadedPasswordTFNotNil() {
        XCTAssertNotNil(sut.passwordTF)
    }
    
    func testWhenViewIsLoadedLoginButtonNotNil() {
        XCTAssertNotNil(sut.loginButton)
    }
    
    func testWhenViewIsLoadedRegistrationCloseNotNil() {
        XCTAssertNotNil(sut.closeButton)
    }
    
    func testWhenViewIsLoadedLogInButtonNotNil() {
        XCTAssertNotNil(sut.logInButton)
    }
    
    func testWhenViewIsLoadedLoginViewNotNil() {
        XCTAssertNotNil(sut.loginView)
    }
    
    func testWhenViewIsLoadedBottomViewNotNil() {
        XCTAssertNotNil(sut.bottomView)
    }
    
    func testLoginButtonPresentsDevicesVC() {
        let registrationVC = presentingRegistrationVC()
        XCTAssertNotNil(registrationVC.loginView)
    }
    
    func presentingRegistrationVC() -> RegistrationVC {
        registrationVC.registrationViewModel = RegistrationViewModel()
        return registrationVC
    }

}
