//
//  QuestionPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation
import RxSwift
import RxCocoa


protocol QuestionPresenterProtocol: AnyObject {
    var questionType: QuestionsType? { get set }
    var questionsDict: [String : String]? { get set }
    var questions: QuestionsProtocol! { get set }
    func knowButtonAction()
    func unKnowButtonAction()
    func unhideAnswerButtonAction()
}

class QuestionPresenter: QuestionPresenterProtocol {
    
    var questions: QuestionsProtocol!
    var questionsDict: [String : String]?
    var questionType: QuestionsType? {
        willSet {
            questionsDict = questions.chooseQuestionsType(of: newValue ?? .network)
        }
    }
    var questionView: QuestionVC!
    var numberOfQuestions = 0
    var trueAnswers = 0
    
    func unhideAnswerButtonAction() {
        self.questionView.answerTextView.isHidden = false
    }
    
    func unKnowButtonAction() {
        questionView.answerTextView.isHidden = true
        
        guard let dict = self.questionsDict, numberOfQuestions < dict.count else {
            questionView.answerTextView.text = "Вы закончили данный раздел"
            questionView.questionTextView.text = "Вы закончили данный раздел"
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
            questionView.answerTextView.text = "Вы закончили данный раздел"
            questionView.questionTextView.text = "Вы закончили данный раздел"
            return
        }
        
        let newQuestion = Array(dict.keys)[numberOfQuestions]
        let newAnswer = Array(dict.values)[numberOfQuestions]
        
        self.questionView.questionTextView.text = newQuestion
        self.questionView.answerTextView.text = newAnswer
        
        numberOfQuestions += 1
        trueAnswers += 1
        
        
        let result = trueAnswers * 100 / (questionsDict?.count ?? 10)
        print(result)
        
        guard let questionType = questionType else { return }
        
        AnswerResults.shared.answersResults.updateValue(result, forKey: questionType.rawValue)
        
        
    }
    
}
