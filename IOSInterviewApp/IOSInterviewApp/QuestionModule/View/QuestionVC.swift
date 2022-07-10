//
//  QuestionVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

class QuestionVC: UIViewController {

    var questionView: QuestionView!
    var questionPresenter: QuestionPresenterProtocol!
    var numberOfQuestion = 0
    
    override func loadView() {
        super.loadView()
        self.view = questionView
        questionView.questionViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вопросы"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.questionView.questionTextView.text = questionPresenter.questionsDict?.first?.key
        self.questionView.answerTextView.text = questionPresenter.questionsDict?.first?.value
        self.questionView.answerTextView.isHidden = true
    }
    

}

extension QuestionVC: QuestionViewDelegate {
    
    func showAnswerButtonDidTapped() {
        self.questionPresenter.unhideAnswerButton()
    }
    
    func knowButtonDidTapped() {
        self.questionPresenter.knowButtonAction()
    }
    
    func unKnowButtonDidTapped() {
        self.questionPresenter.unKnowButtonAction()
    }
}
