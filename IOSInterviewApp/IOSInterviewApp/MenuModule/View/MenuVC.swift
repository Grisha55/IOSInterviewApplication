//
//  MenuVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

class MenuVC: UIViewController {

    var menuView: MenuView!
    var menuPresenter: MenuPresenterProtocol!
    
    override func loadView() {
        super.loadView()
        self.view = menuView
        menuView.menuViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Меню"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

}

extension MenuVC: MenuViewDelegate {
    
    func resultsButtonAction() {
        self.menuPresenter.resultsButtonTapped()
    }
    
    func categoriesButtonAction() {
        self.menuPresenter.categoriesButtonTapped()
    }
}
