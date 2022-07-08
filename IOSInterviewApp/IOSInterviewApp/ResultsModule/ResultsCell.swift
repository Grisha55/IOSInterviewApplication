//
//  ResultsCell.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 08/07/2022.
//

import UIKit

class ResultsCell: UITableViewCell {

    private let moduleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let procentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let stackWithLabels: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    var results: Results? {
        didSet {
            guard let results = results else { return }
            self.moduleLabel.text = results.moduleName
            self.procentLabel.text = "\(results.procents)%"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(stackWithLabels)
        stackWithLabels.addArrangedSubview(moduleLabel)
        stackWithLabels.addArrangedSubview(procentLabel)
        
        setStackWithLabelsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setStackWithLabelsConstraints() {
        stackWithLabels.translatesAutoresizingMaskIntoConstraints = false
        stackWithLabels.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stackWithLabels.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        stackWithLabels.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        stackWithLabels.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    }
    
}
