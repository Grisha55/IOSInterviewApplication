//
//  CategoryCell.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let categoryCell = "CategoryCell"
    
    private(set) lazy var countOfQuestionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSelf()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configureCell(name: String, countOfQuestions: Int) {
        self.nameLabel.text = name
        self.countOfQuestionsLabel.text = "\(countOfQuestions) вопросов"
    }
    
    private func setupUI() {
        self.addSubview(backView)
        self.backView.addSubview(nameLabel)
        self.addSubview(countOfQuestionsLabel)
        
        NSLayoutConstraint.activate([
            self.backView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backView.bottomAnchor.constraint(equalTo: self.countOfQuestionsLabel.topAnchor),
            
            self.nameLabel.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor),
            self.nameLabel.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor),
            
            self.countOfQuestionsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.countOfQuestionsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    private func configureSelf() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
    }
    
}
