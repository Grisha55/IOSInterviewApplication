//
//  MenuPresenter.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 10/07/2022.
//

import Foundation
import RxSwift
import RxCocoa

class MenuViewModel {
    
    private let bag = DisposeBag()
    var router: RouterProtocol!
    
    func transform(_ input: Input) -> Output {
        
        input.category
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.router.categoriesViewController()
            }).disposed(by: bag)
        
        input.results
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.router.resultsViewController()
            }).disposed(by: bag)
        
        return Output()
    }
    
    func resultsButtonTapped() {
        router?.resultsViewController()
    }
    
    func categoriesButtonTapped() {
        router?.categoriesViewController()
    }
}

extension MenuViewModel: ViewModelType {
    
    struct Input {
        let category: Driver<Void>
        let results: Driver<Void>
    }
    
    struct Output {
        
    }
    
}
