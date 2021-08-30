//
//  ResultsView.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 30.08.2021.
//

import UIKit

class ResultsView: UIView {
    
    // MARK: - Properties
    
    private(set) lazy var stackWithViews: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 50
        
        for index in 0 ... 4 {
            let view = UIView()
            let label = UILabel()
            label.text = "\(index + 1)."
            view.addSubview(label)
            view.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .green

            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 70),
                view.widthAnchor.constraint(equalToConstant: 300),
                
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
    
    private func setupUI() {
        self.addSubview(stackWithViews)
        
        NSLayoutConstraint.activate([
            self.stackWithViews.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stackWithViews.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.stackWithViews.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
}
