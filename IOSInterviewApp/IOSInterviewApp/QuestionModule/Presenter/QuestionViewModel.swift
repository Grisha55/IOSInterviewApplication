//
//  QuestionViewModel.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation
import RxSwift
import RxCocoa


class QuestionViewModel {
    
    private let bag = DisposeBag()
    var questions: QuestionsProtocol!
    var questionsDict: [String : String]?
    var questionType: QuestionsType? {
        willSet {
            questionsDict = questions.chooseQuestionsType(of: newValue ?? .network)
        }
    }
    var numberOfQuestionsForQuestion = 0
    var numberOfQuestionsForAnswers = 0
    var trueAnswers = 0.0
    var falseAnswers = 0.1
    
    func transform(_ input: Input) -> Output {
        
        let isHidden = input.showAnswer
            .map({ _ in
                return false
            })
            .startWith(true)
            .asDriver(onErrorJustReturn: true)
        
        let newQuestion = input.next
            .map({ [weak self] in
                guard let dict = self?.questionsDict, let self = self else { return ""}
                
                if self.numberOfQuestionsForQuestion == dict.count - 1 {
                    return "Вопросы закончились"
                } else {
                    self.numberOfQuestionsForQuestion += 1
                }
                return Array(dict.keys)[self.numberOfQuestionsForQuestion]
            })
            
            .startWith("Нажмите на любую кнопку, чтобы продолжить")
            .asDriver(onErrorJustReturn: ":-(")
        
        let newAnswer = input.next
            .map({ [weak self] in
                guard let dict = self?.questionsDict, let self = self else { return ""}
                
                if self.numberOfQuestionsForAnswers == dict.count - 1 {
                    return "Вопросы закончились"
                } else {
                    self.numberOfQuestionsForAnswers += 1
                }
                
                return Array(dict.values)[self.numberOfQuestionsForAnswers]
            })
            .startWith("Нажмите на любую кнопку, чтобы продолжить")
            .asDriver(onErrorJustReturn: ":-(")
        
        let output = Output(newQuestion: newQuestion, newAnswer: newAnswer, isShown: isHidden)
        
        return output
    }
    
}

extension QuestionViewModel: ViewModelType {
    
    struct Input {
        let question: Driver<String?>
        let answer: Driver<String?>
        let next: Driver<Void>
        let showAnswer: Driver<Void>
    }
    
    struct Output {
        let newQuestion: Driver<String>
        let newAnswer: Driver<String>
        let isShown: Driver<Bool>
    }
    
}
