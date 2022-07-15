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
    func unhideAnswerButton()
}

class QuestionViewModel {
    
    private let bag = DisposeBag()
    var questions: QuestionsProtocol!
    var questionsDict: [String : String]?
    var questionType: QuestionsType? {
        willSet {
            questionsDict = questions.chooseQuestionsType(of: newValue ?? .network)
        }
    }
    var numberOfQuestions = 1
    var trueAnswers = 0.0
    var falseAnswers = 0.1
    var newQuestion: Driver<String?>
    var newAnswer: String?
    var isHidden: Bool?
    
    func unhideAnswerButton() {
        //self.questionView.answerTextView.isHidden = false
    }
    
    func transform(_ input: Input) -> Output {
        input.know
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                guard let dict = self.questionsDict, self.numberOfQuestions < dict.count else {
                    self.newQuestion.map { "Вы закончили данный раздел" } 
                    self.newAnswer = "Вы закончили данный раздел"
                    return
                }
                
                self.isHidden = true
                
                self.numberOfQuestions += 1
                self.trueAnswers += 1
                
                let result = Int(self.trueAnswers * 100 / Double(self.numberOfQuestions))
                
                guard let questionType = self.questionType else { return }
                
                AnswerResults.shared.answersResults.updateValue(result, forKey: questionType.rawValue)
            }).disposed(by: bag)
        
        input.unKnow
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                
                self.isHidden = true

                guard let dict = self.questionsDict, self.numberOfQuestions < dict.count else {
                    self.newQuestion = "Вы закончили данный раздел"
                    self.newAnswer = "Вы закончили данный раздел"
                    return
                }

                self.newQuestion = Array(dict.keys)[self.numberOfQuestions]
                self.newAnswer = Array(dict.values)[self.numberOfQuestions]

                self.numberOfQuestions += 1
                self.falseAnswers += 1
            }).disposed(by: bag)
        

        
        return Output(newQuestion: newQuestion, newAnswer: <#T##Driver<String?>#>, isShown: <#T##Driver<Bool?>#>)
    }
    
    func unKnowButtonAction() {
//        questionView.answerTextView.isHidden = true
//
//        guard let dict = self.questionsDict, numberOfQuestions < dict.count else {
//            questionView.answerTextView.text = "Вы закончили данный раздел"
//            questionView.questionTextView.text = "Вы закончили данный раздел"
//            return
//        }
//
//        let newQuestion = Array(dict.keys)[numberOfQuestions]
//        let newAnswer = Array(dict.values)[numberOfQuestions]
//
//        self.questionView.questionTextView.text = newQuestion
//        self.questionView.answerTextView.text = newAnswer
//
//        numberOfQuestions += 1
//        falseAnswers += 1
        
    }
    
    func knowButtonAction() {
//        questionView.answerTextView.isHidden = true
//
//        guard let dict = self.questionsDict, numberOfQuestions < dict.count else {
//            questionView.answerTextView.text = "Вы закончили данный раздел"
//            questionView.questionTextView.text = "Вы закончили данный раздел"
//            return
//        }
//
//        let newQuestion = Array(dict.keys)[numberOfQuestions]
//        let newAnswer = Array(dict.values)[numberOfQuestions]
//
//        self.questionView.questionTextView.text = newQuestion
//        self.questionView.answerTextView.text = newAnswer
//
//        numberOfQuestions += 1
//        trueAnswers += 1
//
//
//        let result = Int(trueAnswers * 100 / Double(numberOfQuestions))
//
//        guard let questionType = questionType else { return }
//
//        AnswerResults.shared.answersResults.updateValue(result, forKey: questionType.rawValue)
        
        
    }
    
}

extension QuestionViewModel: ViewModelType {
    
    struct Input {
        let know: Driver<Void>
        let unKnow: Driver<Void>
        let showAnswer: Driver<Void>
    }
    
    struct Output {
        let newQuestion: Driver<String?>
        let newAnswer: Driver<String?>
        let isShown: Driver<Bool?>
    }
    
}
