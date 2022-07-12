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
    var trueAnswers = 0
    var falseAnswers = 0
    
    func unhideAnswerButton() {
        self.questionView.answerTextView.isHidden = false
    }
    
    func unKnowButtonAction() {
        questionView.answerTextView.isHidden = true
        
        if numberOfQuestions == questionsDict?.count ?? 7 - 1 {
            numberOfQuestions = 0
        }
        
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
        guard let questionType = questionType else { return }
        let result = 7 / numberOfQuestions * 100

        AnswerResults.shared.answersResults.updateValue(result, forKey: questionType.rawValue)
    }
    
    func knowButtonAction() {
        questionView.answerTextView.isHidden = true
        
        if numberOfQuestions == questionsDict?.count ?? 7 - 1 {
            numberOfQuestions = 0
        }
        
        guard let dict = self.questionsDict, numberOfQuestions < dict.count else {
            questionView.answerTextView.text = "Вы закончили данный раздел"
            questionView.questionTextView.text = "Вы закончили данный раздел"
            return
        }
        
        let newQuestion = Array(dict.keys)[numberOfQuestions]
        let newAnswer = Array(dict.values)[numberOfQuestions]
        
        self.questionView.questionTextView.text = newQuestion
        self.questionView.answerTextView.text = newAnswer
        
        self.questionsDict?.removeValue(forKey: newQuestion)
        
        numberOfQuestions += 0
        trueAnswers += 1
    }
    
}
