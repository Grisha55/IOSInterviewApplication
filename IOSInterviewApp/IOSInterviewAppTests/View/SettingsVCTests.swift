//
//  SettingsVCTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 03/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class SettingsVCTests: XCTestCase {

    var sut: SettingsVC!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = SettingsVC()
        sut.settingsPresenter = SettingsPresenter()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedSettingsPresenterNotNil() {
        XCTAssertNotNil(sut.settingsPresenter)
    }
    
    func testWhenViewIsLoadedNotificationLabelNotNil() {
        XCTAssertNotNil(sut.notificationsLabel)
    }
    
    func testWhenViewIsLoadedNotificationToggleNotNil() {
        XCTAssertNotNil(sut.notificationToggle)
    }
    
    func testWhenViewIsLoadedThemeLabelNotNil() {
        XCTAssertNotNil(sut.themeLabel)
    }
    
    func testWhenViewIsLoadedDarkModeToggleNotNil() {
        XCTAssertNotNil(sut.darkModeToggle)
    }
    
    func testWhenViewIsLoadedSubscribtionLabelNotNil() {
        XCTAssertNotNil(sut.subscriptionLabel)
    }
    
    func testWhenViewIsLoadedSubscribtionToggleNotNil() {
        XCTAssertNotNil(sut.subscriptionToggle)
    }
    
    func testIfRouterPresentsLoginVC() {
        let loginVC = presentingLoginVC()
        XCTAssertNotNil(loginVC.loginView)
    }
    
    func presentingLoginVC() -> LogInVC {
        let loginVC = LogInVC()
        loginVC.loginViewModel = LoginViewModel()
        loginVC.loginViewModel.router = Router(navigationController: UINavigationController(), assemblyBuilder: AssemblyBuilder())
        return loginVC
    }

}
