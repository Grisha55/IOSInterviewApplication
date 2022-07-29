//
//  ResultsCell.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 08/07/2022.
//

import UIKit

class ResultsCell: UITableViewCell {

    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.setColor(lightColor: .systemPurple, darkColor: .purple)
        view.layer.cornerRadius = 15.0
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.setColor(lightColor: .yellow, darkColor: .purple).cgColor
        return view
    }()
    
    private let moduleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = UIColor.setColor(lightColor: .white, darkColor: .white)
        return label
    }()
    
    private let procentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = UIColor.setColor(lightColor: .yellow, darkColor: .systemYellow)
        return label
    }()
    
    private let stackWithLabels: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.setColor(lightColor: .clear, darkColor: .clear)
        self.addSubview(backView)
        backView.addSubview(stackWithLabels)
        stackWithLabels.addArrangedSubview(moduleLabel)
        stackWithLabels.addArrangedSubview(procentLabel)
        
        setStackWithLabelsConstraints()
        setBackViewContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configureResultsCell(module: String, procent: Int) {
        self.moduleLabel.text = module
        self.procentLabel.text = "\(procent)%"
    }
    
    private func setBackViewContraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
    }
    
    private func setStackWithLabelsConstraints() {
        stackWithLabels.translatesAutoresizingMaskIntoConstraints = false
        stackWithLabels.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 10).isActive = true
        stackWithLabels.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -10).isActive = true
        stackWithLabels.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -10).isActive = true
        stackWithLabels.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 10).isActive = true
    }
    
}
