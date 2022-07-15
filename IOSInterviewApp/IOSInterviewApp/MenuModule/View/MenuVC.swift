//
//  MenuVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

class MenuVC: UIViewController {

    var menuViewModel: MenuViewModel!
    
    lazy var stackWithButtons: UIStackView = {
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
    
    lazy var categoriesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Категории", for: .normal)
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var resultsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Результаты", for: .normal)
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Меню"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupUI()
        bind()
    }

    private func bind() {
        let input = MenuViewModel.Input(category: categoriesButton.rx.tap.asDriver(), results: resultsButton.rx.tap.asDriver())
        
        let _ = menuViewModel.transform(input)
    }
    
    private func setupUI() {
        view.addSubview(stackWithButtons)
        NSLayoutConstraint.activate([
            self.stackWithButtons.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackWithButtons.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.stackWithButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            self.stackWithButtons.heightAnchor.constraint(equalToConstant: 200),
            
            self.categoriesButton.widthAnchor.constraint(equalTo: self.stackWithButtons.widthAnchor),
            self.resultsButton.widthAnchor.constraint(equalTo: self.stackWithButtons.widthAnchor)
        ])
    }
    
}
