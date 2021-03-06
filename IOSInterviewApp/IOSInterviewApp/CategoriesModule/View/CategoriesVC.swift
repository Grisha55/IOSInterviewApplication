//
//  CategoriesVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

class CategoriesVC: UIViewController {

    // MARK: - Properties
    
    var categoriesPresenter: CategoriesPresenterProtocol!
    
    private(set) lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.categoryCell)
        cv.delegate = self
        cv.dataSource = self
        cv.frame = self.view.bounds
        cv.backgroundColor = UIColor.setColor(lightColor: .white, darkColor: .black)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.setColor(lightColor: .white, darkColor: .black)
        setupNavigationController()
        setupUI()
    }
    
    // MARK: - Methods

    private func setupNavigationController() {
        self.title = "Категории"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.setColor(lightColor: .black, darkColor: .white)]
        let backButton = UIBarButtonItem(title: "Меню", style: .done, target: self, action: #selector(backButtonAction))
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        backButton.tintColor = UIColor.setColor(lightColor: .black, darkColor: .white)
    }
    
    @objc func backButtonAction() {
        self.navigationController?.dismiss(animated: true)
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
    
}

extension CategoriesVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        self.categoriesPresenter.transiteModuleName(indexPath: indexPath)
    }
}

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 30, height: self.view.frame.height / 3 - 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension CategoriesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoriesPresenter.names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.categoryCell, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
        
        let name = self.categoriesPresenter.names[indexPath.row]
        let countOfQuestions = self.categoriesPresenter.countOfQuestions(name: name)
        
        cell.configureCell(name: name, countOfQuestions: countOfQuestions)
        return cell
    }
}
