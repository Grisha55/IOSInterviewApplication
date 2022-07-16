//
//  QuestionVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class QuestionVC: UIViewController {

    private let bag = DisposeBag()
    var questionViewModel: QuestionViewModel!
    var numberOfQuestion = 0
    
    lazy var stackWithButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 50
        
        stack.addArrangedSubview(nextButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show next", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    lazy var answerTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = .green
        textView.isHidden = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var questionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = .lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var showAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("ShowAnswer", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        title = "Вопросы"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
        bind()
    }
    
    private func bind() {
        let inputs = QuestionViewModel.Input(question: questionTextView.rx.text.asDriver(),
                                             answer: answerTextView.rx.text.asDriver(),
                                             next: nextButton.rx.tap.asDriver(),
                                             showAnswer: showAnswerButton.rx.tap.asDriver())
        
        let output = questionViewModel.transform(inputs)
        output.newQuestion
            .drive(questionTextView.rx.text)
            .disposed(by: bag)
        
        output.newAnswer
            .drive(answerTextView.rx.text)
            .disposed(by: bag)
        
        output.isShown
            .drive(answerTextView.rx.isHidden)
            .disposed(by: bag)
    }
    
    private func setupUI() {
        view.addSubview(questionTextView)
        view.addSubview(answerTextView)
        view.addSubview(stackWithButtons)
        view.addSubview(showAnswerButton)
        
        NSLayoutConstraint.activate([
            self.stackWithButtons.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackWithButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            self.stackWithButtons.heightAnchor.constraint(equalToConstant: 80),
            self.stackWithButtons.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            self.answerTextView.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: 30),
            self.answerTextView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.answerTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            self.questionTextView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.questionTextView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.questionTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.questionTextView.heightAnchor.constraint(equalToConstant: 120),
            
            self.showAnswerButton.topAnchor.constraint(equalTo: answerTextView.bottomAnchor, constant: 5),
            self.showAnswerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.showAnswerButton.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10)
        ])
    }
    
}
