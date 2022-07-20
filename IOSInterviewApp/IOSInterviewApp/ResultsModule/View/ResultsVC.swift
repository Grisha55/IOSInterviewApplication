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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        resultsPresenter.pairResultsTableAndRealm(tableView: resultTableView)
    }
    
    // MARK: - Methods
    
    private func setupNavigationController() {
        title = "Результаты"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let settingsButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(settingsButtonDidTapped))
        self.navigationItem.rightBarButtonItem = settingsButton
        configureResultTableView()
        setResultTableViewConstraints()
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
    
    private func setResultTableViewConstraints() {
        resultTableView.translatesAutoresizingMaskIntoConstraints = false
        resultTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        resultTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
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
