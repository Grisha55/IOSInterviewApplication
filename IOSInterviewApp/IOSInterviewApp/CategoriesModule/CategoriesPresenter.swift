//
//  CategoriesPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 10/07/2022.
//

import Foundation

protocol CategoriesPresenterProtocol: AnyObject {
    var names: [String] { get set }
    func transiteModuleName(indexPath: IndexPath)
    func countOfQuestions(name: String) -> Int
}

class CategoriesPresenter: CategoriesPresenterProtocol {
    
    var router: RouterProtocol!
    var names = ["swift", "network", "multithrading", "ui", "dataBase", "patterns"]
    var questions: QuestionsProtocol!
    
    func transiteModuleName(indexPath: IndexPath) {
        let category = names[indexPath.row]
        router.questionsViewController(questionsType: QuestionsType(rawValue: category) ?? .network)
    }
    
    func countOfQuestions(name: String) -> Int {
        let count = questions.chooseQuestionsType(of: QuestionsType(rawValue: name) ?? .network).count
        return count
    }
}
