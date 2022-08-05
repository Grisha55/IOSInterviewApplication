//
//  AlertsFactoryTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 05/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class AlertsFactoryTests: XCTestCase {

    var isPresented = false
    var alertNotNil = false
    var alertController: UIAlertController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        alertController = UIAlertController()
    }

    override func tearDownWithError() throws {
        alertController = nil
        
        try super.tearDownWithError()
    }

    func testIsPresentedIsTrue() {
        let _ = getAlert(by: .wrongLoginEmail)
        XCTAssertTrue(isPresented)
    }
    
    func testAlertNotNil() {
        let _ = getAlert(by: .wrongLoginPassword)
        XCTAssertTrue(alertNotNil)
    }
    
    func testIfAlertControllerHasAction() {
        let _ = showAlert()
        let action = alertController.actions.count
        XCTAssertEqual(action, 1)
    }
    
    func showAlert() -> UIViewController {
        alertController = UIAlertController(title: "Bar", message: "Buz", preferredStyle: .alert)
        let action = UIAlertAction(title: "Bar", style: .default)
        
        alertController.addAction(action)
        return alertController
    }

}

extension AlertsFactoryTests: AlertsFactoryProtocol {
    
    func getAlert(by type: Alerts) -> UIViewController {
        switch type {
        case .wrongLoginEmail:
            isPresented = true
            alertNotNil = true
            return showAlert()
        case .wrongLoginPassword:
            isPresented = true
            alertNotNil = true
            return showAlert()
        case .wrongRegistrationLogin:
            isPresented = true
            alertNotNil = true
            return showAlert()
        case .wrongRegistrationPassword:
            isPresented = true
            alertNotNil = true
            return showAlert()
        }
    }
    
}
