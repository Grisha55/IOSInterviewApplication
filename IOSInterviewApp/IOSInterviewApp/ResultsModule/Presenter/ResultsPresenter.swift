//
//  ResultsPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 09/07/2022.
//

import Foundation

protocol ResultsPresenterProtocol: AnyObject {
    var results: [Results] { get }
}

class ResultsPresenter: ResultsPresenterProtocol {
    
    var results = [Results(moduleName: "UI", procents: 80),
                           Results(moduleName: "Network", procents: 10)]
    
}
