//
//  ResultsVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 30.08.2021.
//

import UIKit

class ResultsVC: UIViewController {

    override func loadView() {
        super.loadView()
        
        let resultsView = ResultsView()
        self.view = resultsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Результаты"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    

}
