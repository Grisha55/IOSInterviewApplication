//
//  QuestionView.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

protocol QuestionViewDelegate: AnyObject {
    func knowButtonDidTapped()
    func unKnowButtonDidTapped()
    func showAnswerButtonDidTapped()
}

class QuestionView: UIView {
    
    // MARK: - Properties
    
    weak var questionViewDelegate: QuestionViewDelegate!
    
    private(set) lazy var stackWithButtons: UIStackView = {
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
    
    private(set) lazy var unKnowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dislike"), for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(unKnowButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var knowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(knowButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var answerTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = .green
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private(set) lazy var questionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = .lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private(set) lazy var showAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("ShowAnswer", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(showAnswerButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        self.addSubview(questionTextView)
        self.addSubview(answerTextView)
        self.addSubview(stackWithButtons)
        self.addSubview(showAnswerButton)
        
        NSLayoutConstraint.activate([
            self.stackWithButtons.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stackWithButtons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.stackWithButtons.heightAnchor.constraint(equalToConstant: 80),
            self.stackWithButtons.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            self.answerTextView.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: 30),
            self.answerTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.answerTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.questionTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.questionTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.questionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.questionTextView.heightAnchor.constraint(equalToConstant: 120),
            
            self.showAnswerButton.topAnchor.constraint(equalTo: answerTextView.bottomAnchor, constant: 5),
            self.showAnswerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.showAnswerButton.bottomAnchor.constraint(equalTo: unKnowButton.topAnchor, constant: -10)
        ])
    }
    
    @objc func showAnswerButtonDidTapped() {
        questionViewDelegate.showAnswerButtonDidTapped()
    }
    
    @objc func unKnowButtonDidTapped() {
        questionViewDelegate.unKnowButtonDidTapped()
    }
    
    @objc func knowButtonDidTapped() {
        questionViewDelegate.knowButtonDidTapped()
    }
    
}
