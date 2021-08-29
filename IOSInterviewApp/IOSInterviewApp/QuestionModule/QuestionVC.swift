//
//  QuestionVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

class QuestionVC: UIViewController {

    override func loadView() {
        super.loadView()
        let questionView = QuestionView()
        self.view = questionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Вопросы"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    

}
