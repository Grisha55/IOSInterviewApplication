//
//  ResultsPresenterTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 03/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class ResultsPresenterTests: XCTestCase {

    var sut: ResultsPresenter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = ResultsPresenter()
        sut.realmService = RealmService()
        sut.router = Router(navigationController: UINavigationController(), assemblyBuilder: AssemblyBuilder())
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedRealmServiceNotNil() {
        XCTAssertNotNil(sut.realmService)
    }
    
    func testWhenViewIsLoadedRouterNotNil() {
        XCTAssertNotNil(sut.router)
    }
    
    func testRouterPresentsSettingsVC() {
        let settingsVC = presentingSettingsVC()
        XCTAssertNotNil(settingsVC.notificationsLabel)
    }
    
    func presentingSettingsVC() -> SettingsVC {
        let settingsVC = SettingsVC()
        settingsVC.settingsPresenter = SettingsPresenter()
        return settingsVC
    }

}
