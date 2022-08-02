//
//  FirebaseServiceTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 01/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class FirebaseServiceTests: XCTestCase {

    var sut: FirebaseService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = FirebaseService()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testIfUserCanBeRegistered() {
        sut.register(name: "Custom", email: "some@mail.com", password: "password") { result in
            switch result {
            case .success(let user):
                XCTAssertNotNil(user)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
    
    func testIfUserIsValide() {
        sut.login(email: "gregorywin@mail.com", password: "12345") { result in
            switch result {
            case .success(let user):
                XCTAssertNotNil(user)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
    
    func testIfUserIsRegistrated() {
        XCTAssertTrue(logInUser(login: "Bar", password: "Buz"))
    }
    
    func testIfUserDataIsTrueForRegistration() {
        let name = "Custom"
        let login = "Login"
        let password = "Password"
        XCTAssertTrue(registerUser(name: name, login: login, password: password))
        XCTAssertTrue(name.count > 4)
        XCTAssertTrue(login.count > 4)
        XCTAssertTrue(password.count > 4)
        XCTAssertTrue(login != password)
    }
    
    func registerUser(name: String, login: String, password: String) -> Bool {
        if name.count > 4 && login.count > 4 && password.count > 4 && login != password {
            return true
        }
        return false
    }
    
    func logInUser(login: String, password: String) -> Bool {
        if login == "Bar" && password == "Buz" {
            return true
        }
        return false
    }

}
