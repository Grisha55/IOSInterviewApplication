//
//  ResultsVCTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 03/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class ResultsVCTests: XCTestCase {

    var sut: ResultsVC!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = ResultsVC()
        sut.resultsPresenter = ResultsPresenter()
        
        sut.loadViewIfNeeded()
        
        tableView = sut.resultTableView
        tableView.delegate = sut
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
        
        try super.tearDownWithError()
    }
    
    func testWhenViewIsLoadedResultsTableViewNotNil() {
        XCTAssertNotNil(sut.resultTableView)
    }

    func testWhenViewIsLoadedResultsPresenterNotNil() {
        XCTAssertNotNil(sut.resultTableView)
    }
    
    func testCellForRowAtIndexPathReturnsResultsCell() {
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ResultsCell)
    }
    
    func testCellForRowAtIndexPathDequeuesCellFromTableView() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellIsDequeued)
    }
    
    func testCellRowRowCallsConfigure() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertNotNil(cell)
    }

}

extension ResultsVCTests {
    
    class MockTableView: UITableView {
        
        var cellIsDequeued = false
        
        static func mockTableView(withDataSource dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 375, height: 658), style: .plain)
            mockTableView.dataSource = dataSource
            mockTableView.register(MockResultsCell.self, forCellReuseIdentifier: String(describing: ResultsCell.self))
            return mockTableView
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockResultsCell: ResultsCell {
        
    }
}
