//
//  ResultsVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 30.08.2021.
//

import UIKit

class ResultsVC: UIViewController {

    var resultsPresenter: ResultsPresenterProtocol!
    
    lazy var resultTableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    lazy var resetAllElementsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Очистить все", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(resetButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigationController()
        setResultTableViewConstraints()
        setResetAllElementsButtonConstraints()
        resultsPresenter.pairResultsTableAndRealm(tableView: resultTableView)
    }
    
    // MARK: - Methods
    
    @objc
    func resetButtonDidTapped() {
        self.resultsPresenter.deleteAllElements()
    }
    
    private func setupNavigationController() {
        title = "Результаты"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let settingsButton = UIBarButtonItem(title: "Настройки", style: .done, target: self, action: #selector(settingsButtonDidTapped))
        self.navigationItem.rightBarButtonItem = settingsButton
        settingsButton.tintColor = .black
        
        let newBackButton = UIBarButtonItem(title: "Меню",
                                            style: .plain, target: self, action: #selector(backButtonAction))
        navigationController?.navigationBar.topItem?.backBarButtonItem = newBackButton
        newBackButton.tintColor = .black
        configureResultTableView()
    }
    
    @objc
    func backButtonAction() {
        self.dismiss(animated: true)
    }
    
    @objc
    func settingsButtonDidTapped() {
        self.resultsPresenter.settingsButtonDidTapped()
    }
    
    private func configureResultTableView() {
        view.addSubview(resultTableView)
        resultTableView.register(ResultsCell.self, forCellReuseIdentifier: String(describing: ResultsCell.self))
        resultTableView.rowHeight = 80
        resultTableView.dataSource = self
        resultTableView.delegate = self
    }
    
    private func setResetAllElementsButtonConstraints() {
        view.addSubview(resetAllElementsButton)
        resetAllElementsButton.translatesAutoresizingMaskIntoConstraints = false
        resetAllElementsButton.topAnchor.constraint(equalTo: self.resultTableView.bottomAnchor, constant: 50).isActive = true
        resetAllElementsButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        resetAllElementsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func setResultTableViewConstraints() {
        resultTableView.translatesAutoresizingMaskIntoConstraints = false
        resultTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        resultTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        resultTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    }
    

}

// MARK: - UITableViewDelegate
extension ResultsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension ResultsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsPresenter.realmResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ResultsCell.self), for: indexPath) as? ResultsCell else { return UITableViewCell() }
        
        guard let results = resultsPresenter.realmResults?[indexPath.row] else { return UITableViewCell() }
        cell.configureResultsCell(module: results.moduleName, procent: results.procents)
        return cell
    }
}
