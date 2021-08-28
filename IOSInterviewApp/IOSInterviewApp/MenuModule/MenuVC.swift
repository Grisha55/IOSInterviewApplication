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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Меню"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}
