//
//  QuestionPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation

protocol QuestionPresenterProtocol: AnyObject {
    var questionType: QuestionsType? { get }
}

class QuestionPresenter: QuestionPresenterProtocol {
    
    var questionType: QuestionsType?
    
}
