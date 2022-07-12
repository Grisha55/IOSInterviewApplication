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
    var trueAnswers = 0.0
    var falseAnswers = 0.1
    
    func unhideAnswerButton() {
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
        falseAnswers += 1
        
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
        
        //self.questionsDict?.removeValue(forKey: newQuestion)
        
        numberOfQuestions += 1
        trueAnswers += 1
        
        
        let result = Int(trueAnswers * 100 / Double(numberOfQuestions))
        
        guard let questionType = questionType else { return }
        
        AnswerResults.shared.answersResults.updateValue(result, forKey: questionType.rawValue)
        
        
    }
    
}
