//
//  SettingsView.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

protocol SettingsViewDelegate: AnyObject {
    func exitButtonAction()
}

class SettingsView: UIView {
    
    // MARK: - Properties
    
    weak var settingsViewDelegate: SettingsViewDelegate?
    
    private(set) lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выйти", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(exitButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var stackWithViews: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 30
        
        let settingsLabels = ["Уведомления", "Тема", "Подписка"]
        
        for str in settingsLabels {
            let view = UIView()
            let label = UILabel()
            let switcher = UISwitch()
            
            label.text = str
            label.font = UIFont.boldSystemFont(ofSize: 23)
            
            view.addSubview(label)
            view.addSubview(switcher)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            switcher.translatesAutoresizingMaskIntoConstraints = false
            view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 70),
                
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                
                switcher.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 30),
                switcher.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                switcher.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
            
            stack.addArrangedSubview(view)
        }
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
    
    @objc private func exitButtonDidTapped() {
        self.settingsViewDelegate?.exitButtonAction()
    }
    
    private func setupUI() {
        self.addSubview(stackWithViews)
        self.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            self.stackWithViews.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            self.stackWithViews.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stackWithViews.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.exitButton.topAnchor.constraint(equalTo: self.stackWithViews.bottomAnchor, constant: 80),
            self.exitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
