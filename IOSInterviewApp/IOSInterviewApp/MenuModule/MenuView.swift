//
//  MenuView.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

class MenuView: UIView {
    
    // MARK: - Properties
    
    private(set) lazy var stackWithButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 40
        
        stack.addArrangedSubview(categoriesButton)
        stack.addArrangedSubview(resultsButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private(set) lazy var categoriesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Категории", for: .normal)
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var resultsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Результаты", for: .normal)
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 20
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
        self.addSubview(stackWithButtons)
        NSLayoutConstraint.activate([
            self.stackWithButtons.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stackWithButtons.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.stackWithButtons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.stackWithButtons.heightAnchor.constraint(equalToConstant: 200),
            
            self.categoriesButton.widthAnchor.constraint(equalTo: self.stackWithButtons.widthAnchor),
            self.resultsButton.widthAnchor.constraint(equalTo: self.stackWithButtons.widthAnchor)
        ])
    }
    
}
