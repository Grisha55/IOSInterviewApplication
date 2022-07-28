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
    var questionPresenter: QuestionPresenterProtocol!
    
    lazy var stackWithButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 20
        
        stack.addArrangedSubview(knowButton)
        stack.addArrangedSubview(unKnowButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var knowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Знаю", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.setColor(lightColor: .black, darkColor: .white).cgColor
        button.addTarget(self, action: #selector(knowButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var unKnowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Не знаю", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.setColor(lightColor: .black, darkColor: .white).cgColor
        button.addTarget(self, action: #selector(unKnowButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var answerTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = UIColor.setColor(lightColor: .systemPurple, darkColor: .brown)
        textView.isHidden = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var questionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = UIColor.setColor(lightColor: .systemPurple, darkColor: .orange)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var showAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Показать ответ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .light)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showAnswerButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.setColor(lightColor: .purple, darkColor: .black)
        setupNavigationController()
        setupUI()
        setupFirstQuestions()
    }
    
    private func setupNavigationController() {
        title = "Вопросы"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.setColor(lightColor: .black, darkColor: .white)]
        
        let newBackButton = UIBarButtonItem(title: "Категории", style: .done, target: self, action: #selector(backButtonAction))
        navigationController?.navigationBar.topItem?.backBarButtonItem = newBackButton
        newBackButton.tintColor = UIColor.setColor(lightColor: .white, darkColor: .white)
    }
    
    @objc func backButtonAction() {
        self.navigationController?.dismiss(animated: true)
    }
    
    private func setupFirstQuestions() {
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
            self.stackWithButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.stackWithButtons.heightAnchor.constraint(equalToConstant: 200),
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
            self.showAnswerButton.bottomAnchor.constraint(equalTo: knowButton.topAnchor, constant: -10)
        ])
    }
    
    @objc
    func knowButtonAction() {
        self.questionPresenter.knowButtonAction()
    }
    
    @objc
    func unKnowButtonAction() {
        self.questionPresenter.unKnowButtonAction()
    }
    
    @objc
    func showAnswerButtonAction() {
        self.questionPresenter.unhideAnswerButtonAction()
    }
    
}
