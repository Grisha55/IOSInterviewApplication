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
    var results = [Results]()
    var realmService: RealmServiceProtocol!
    var questionsDict: [String : String]?
    var questionType: QuestionsType? {
        willSet {
            questionsDict = questions.chooseQuestionsType(of: newValue ?? .network)
        }
    }
    var questionView: QuestionVC!
    var numberOfQuestions = 1
    var trueAnswers = 0
    
    func unhideAnswerButtonAction() {
        self.questionView.answerTextView.isHidden = false
    }
    
    func unKnowButtonAction() {
        questionView.answerTextView.isHidden = true
        
        guard let dict = self.questionsDict, numberOfQuestions < dict.count else {
            questionView.answerTextView.text = "Вы закончили данный раздел"
            questionView.questionTextView.text = "Вы закончили данный раздел"
            self.saveDataIntoRealm()
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
            self.saveDataIntoRealm()
            return
        }
        
        let newQuestion = Array(dict.keys)[numberOfQuestions]
        let newAnswer = Array(dict.values)[numberOfQuestions]
        
        self.questionView.questionTextView.text = newQuestion
        self.questionView.answerTextView.text = newAnswer
        
        numberOfQuestions += 1
        trueAnswers += 1
        
        
        let procents = trueAnswers * 100 / (questionsDict?.count ?? 10)
        guard let questionType = questionType else { return }
        
        let result = Results()
        result.moduleName = questionType.rawValue
        result.procents = procents

        self.results.append(result)
    }
    
    private func saveDataIntoRealm() {
        guard let lastElement = results.last else { return }
        realmService.savingDataIntoRealm(result: lastElement, module: questionType?.rawValue ?? "")
        
        questionView.shapeLayer.isHidden = false
        questionView.circleImageView.isHidden = false
        
        let value = Float(lastElement.procents) / 100.0
        
        questionView.startCustomAnimation(to: value)
    }
    
}
