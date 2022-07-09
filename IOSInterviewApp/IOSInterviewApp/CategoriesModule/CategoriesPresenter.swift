//
//  CategoriesPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 10/07/2022.
//

import Foundation

protocol CategoriesPresenterProtocol: AnyObject {
    var names: [String] { get }
    func transiteModuleName(indexPath: IndexPath)
}

class CategoriesPresenter: CategoriesPresenterProtocol {
    
    var router: RouterProtocol!
    let names = ["swift", "network", "multithrading", "ui", "database", "patterns"]
    
    func transiteModuleName(indexPath: IndexPath) {
        let category = names[indexPath.row]
        router.questionsViewController(questionsType: QuestionsType(rawValue: category) ?? .network)
    }
}
