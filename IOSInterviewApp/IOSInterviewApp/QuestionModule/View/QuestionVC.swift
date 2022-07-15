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
    
    lazy var stackWithButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 50
        
        stack.addArrangedSubview(knowButton)
        stack.addArrangedSubview(unKnowButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var unKnowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dislike"), for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    lazy var knowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
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
        
        self.questionTextView.text = questionPresenter.questionsDict?.first?.key
        self.answerTextView.text = questionPresenter.questionsDict?.first?.value
        self.answerTextView.isHidden = true
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
            self.showAnswerButton.bottomAnchor.constraint(equalTo: unKnowButton.topAnchor, constant: -10)
        ])
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
