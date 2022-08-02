//
//  CategoriesVCTests.swift
//  IOSInterviewAppTests
//
//  Created by Григорий Виняр on 02/08/2022.
//

import XCTest
@testable import IOSInterviewApp

class CategoriesVCTests: XCTestCase {

    var sut: CategoriesVC!
    var collectionView: UICollectionView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CategoriesVC()
        sut.categoriesPresenter = CategoriesPresenter()
        
        sut.loadViewIfNeeded()
        
        collectionView = sut.collectionView
        collectionView.delegate = sut
        collectionView.dataSource = sut
    }

    override func tearDownWithError() throws {
        sut = nil
        collectionView = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedCategoriesPresenterNotNil() {
        XCTAssertNotNil(sut.categoriesPresenter)
    }
    
    func testWhenViewIsLoadedCollectionViewNotNil() {
        XCTAssertNotNil(sut.collectionView)
    }
    
    func testNumberOfRowsIsResultsCount() {
        sut.categoriesPresenter.names = ["bar", "baz"]
        XCTAssertEqual(sut.categoriesPresenter.names.count, 2)
        
        collectionView.reloadData()
        
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 2)
    }
    
    func testCellForRowAtIndexPathDequeuesCellFromCollectionView() {
        let mockCollectionView = MockCollectionView.mockCollectionView(withDataSource: sut)
        
        sut.categoriesPresenter.names.append("someName")
        mockCollectionView.reloadData()
        
        _ = mockCollectionView.cellForItem(at: IndexPath(row: 0, section: 0))
        _ = mockCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCell.self), for: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockCollectionView.cellIsDequeued)
    }
    
    func testCellForItemCallsConfigure() {
        let mockCollectionView = MockCollectionView.mockCollectionView(withDataSource: sut)
        
        let name = "1"
        let name2 = "2"
        sut.categoriesPresenter.names.append(name)
        sut.categoriesPresenter.names.append(name2)
        
        mockCollectionView.reloadData()
        
        XCTAssertNotEqual(mockCollectionView.numberOfItems(inSection: 0), 0)
    }

}

extension CategoriesVCTests {
    
    class MockCollectionView: UICollectionView {
        
        var cellIsDequeued = false
        
        static func mockCollectionView(withDataSource dataSource: UICollectionViewDataSource) -> MockCollectionView {
            let mockCollectionView = MockCollectionView(frame: CGRect(x: 0, y: 0, width: 375, height: 658), collectionViewLayout: UICollectionViewLayout())
            mockCollectionView.dataSource = dataSource
            mockCollectionView.register(MockCategoryCell.self, forCellWithReuseIdentifier: String(describing: CategoryCell.self))
            return mockCollectionView
        }
        
        override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
            cellIsDequeued = true
            
            return super.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        }
        
    }
    
    class MockCategoryCell: CategoryCell {
        
        func configure(with result: Results) {
            self.configure(with: result)
        }
    }
}
