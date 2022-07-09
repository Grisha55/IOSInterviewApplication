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
    
    override func loadView() {
        super.loadView()
        self.view = questionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Вопросы"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        print(questionPresenter.questionType)
    }
    

}
