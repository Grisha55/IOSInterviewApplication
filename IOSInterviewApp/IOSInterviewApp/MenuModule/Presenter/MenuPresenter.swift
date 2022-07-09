//
//  MenuPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 10/07/2022.
//

import Foundation

protocol MenuPresenterProtocol: AnyObject {
    func resultsButtonTapped()
    func categoriesButtonTapped()
}

class MenuPresenter: MenuPresenterProtocol {
    
    var router: RouterProtocol?
    
    func resultsButtonTapped() {
        router?.resultsViewController()
    }
    
    func categoriesButtonTapped() {
        router?.categoriesViewController()
    }
}
