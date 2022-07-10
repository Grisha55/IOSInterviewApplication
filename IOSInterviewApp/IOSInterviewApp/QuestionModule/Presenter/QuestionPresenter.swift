//
//  QuestionPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation

protocol QuestionPresenterProtocol: AnyObject {
    var questionType: QuestionsType? { get set }
    var questionsDict: [String : String]? { get set }
    var questions: QuestionsProtocol! { get set }
    func knowButtonAction()
    func unKnowButtonAction()
    func unhideAnswerButton()
}

class QuestionPresenter: QuestionPresenterProtocol {
    
    var questions: QuestionsProtocol!
    var questionsDict: [String : String]?
    var questionType: QuestionsType? {
        willSet {
            questionsDict = questions.chooseQuestionsType(of: newValue ?? .network)
        }
    }
    var questionView: QuestionView!
    var numberOfQuestions = 1
    
    func unhideAnswerButton() {
        self.questionView.answerTextView.isHidden = false
    }
    
    func unKnowButtonAction() {
        questionView.answerTextView.isHidden = true
        guard let dict = self.questionsDict, numberOfQuestions < dict.count else {
            numberOfQuestions = 0
            return
        }
        
        let newQuestion = Array(dict.keys)[numberOfQuestions]
        let newAnswer = Array(dict.values)[numberOfQuestions]
        
        self.questionView.questionTextView.text = newQuestion
        self.questionView.answerTextView.text = newAnswer
        
        numberOfQuestions += 1
    }
    
    func knowButtonAction() {
        questionView.answerTextView.isHidden = true
        guard let dict = self.questionsDict, numberOfQuestions < dict.count else {
            numberOfQuestions = 0
            return
        }
        
        let newQuestion = Array(dict.keys)[numberOfQuestions]
        let newAnswer = Array(dict.values)[numberOfQuestions]
        
        self.questionView.questionTextView.text = newQuestion
        self.questionView.answerTextView.text = newAnswer
        
        self.questionsDict?.removeValue(forKey: newQuestion)
        
        numberOfQuestions += 0
    }
    
}
