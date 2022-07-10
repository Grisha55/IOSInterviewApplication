//
//  ResultsPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation

protocol ResultsPresenterProtocol: AnyObject {
    var results: [Results] { get }
    func settingsButtonDidTapped()
}

class ResultsPresenter: ResultsPresenterProtocol {
    
    var router: RouterProtocol!
    var results = [Results(moduleName: "UI", procents: 80),
                           Results(moduleName: "Network", procents: 10)]
    
    func settingsButtonDidTapped() {
        self.router.settingsViewController()
    }
}
