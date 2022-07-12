//
//  AnswerResults.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 12/07/2022.
//

import Foundation

final class AnswerResults {
    
    static let shared = AnswerResults()
    
    private init(){}
    
    var answersResults: [String : Int] = [
        "swift" : 0,
        "network" : 0,
        "multithrading" : 0,
        "ui" : 0,
        "dataBase" : 0,
        "patterns" : 0,
    ]
    
}
