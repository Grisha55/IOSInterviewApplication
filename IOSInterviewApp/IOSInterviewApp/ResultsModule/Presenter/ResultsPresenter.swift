//
//  ResultsPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation

protocol ResultsPresenterProtocol: AnyObject {
    var results: [String : Int] { get }
    func settingsButtonDidTapped()
}

class ResultsPresenter: ResultsPresenterProtocol {
    
    var router: RouterProtocol!
    var results = AnswerResults.shared.answersResults
    
    func settingsButtonDidTapped() {
        self.router.settingsViewController()
    }
}
