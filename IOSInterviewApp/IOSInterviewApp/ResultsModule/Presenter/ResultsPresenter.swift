//
//  ResultsPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import UIKit
import RealmSwift

protocol ResultsPresenterProtocol: AnyObject {
    func settingsButtonDidTapped()
    func pairResultsTableAndRealm(tableView: UITableView)
    var realmResults: RealmSwift.Results<Results>? { get }
    func deleteAllElements()
}

class ResultsPresenter: ResultsPresenterProtocol {
    
    var router: RouterProtocol!
    var realmService: RealmServiceProtocol!
    var realmResults: RealmSwift.Results<Results>?
    var token: NotificationToken?
    
    func deleteAllElements() {
        self.realmService.deleteAllResultsFromRealm()
    }
    
    func pairResultsTableAndRealm(tableView: UITableView) {
        guard let realm = try? Realm() else { return }
        realmResults = realm.objects(Results.self)
        token = realmResults?.observe({ (changes) in
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map({IndexPath(row: $0, section: $0)}), with: .automatic)
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: $0) }), with: .automatic)
                tableView.endUpdates()
            case .error(let error):
                fatalError("\(error.localizedDescription)")
            }
        })
    }
    
    func settingsButtonDidTapped() {
        self.router.settingsViewController()
    }
}
