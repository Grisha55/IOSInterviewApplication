//
//  MenuVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

class MenuVC: UIViewController {

    override func loadView() {
        super.loadView()
        let menuView = MenuView()
        self.view = menuView
        menuView.menuViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Меню"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension MenuVC: MenuViewDelegate {
    
    func resultsButtonAction() {
        let resultsVC = ResultsVC()
        self.navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    func categoriesButtonAction() {
        let categoriesVC = CategoriesVC()
        self.navigationController?.pushViewController(categoriesVC, animated: true)
    }
}
