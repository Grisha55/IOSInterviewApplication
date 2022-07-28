//
//  SettingsVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 29.08.2021.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - Properties
    var settingsPresenter: SettingsPresenterProtocol!
    
    private(set) lazy var notificationsLabel: UILabel = {
        let label = UILabel()
        label.text = "Уведомления"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.setColor(lightColor: .yellow, darkColor: .purple)
        return label
    }()
    
    private(set) lazy var themeLabel: UILabel = {
        let label = UILabel()
        label.text = "Оформление"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.setColor(lightColor: .yellow, darkColor: .purple)
        return label
    }()
    
    private(set) lazy var subscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Подписка"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.setColor(lightColor: .yellow, darkColor: .purple)
        return label
    }()
    
    private(set) lazy var notificationToggle: UISwitch = {
        let toggle = UISwitch()
        return toggle
    }()
    
    private(set) lazy var darkModeToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.addTarget(self, action: #selector(darkModeToggleAction(_:)), for: .touchUpInside)
        return toggle
    }()
    
    private(set) lazy var subscriptionToggle: UISwitch = {
        let toggle = UISwitch()
        return toggle
    }()
    
    private(set) lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выйти", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(exitButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var stackWithToggles: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.distribution = .fillEqually
        stack.spacing = 30
        
        stack.addArrangedSubview(notificationToggle)
        stack.addArrangedSubview(darkModeToggle)
        stack.addArrangedSubview(subscriptionToggle)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private(set) lazy var stackWithLabels: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 30
        
        stack.addArrangedSubview(notificationsLabel)
        stack.addArrangedSubview(themeLabel)
        stack.addArrangedSubview(subscriptionLabel)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.setColor(lightColor: .purple, darkColor: .black)
        setupUI()
        setupNavigationController()
    }
    
    // MARK: - Methods
    
    private func setupNavigationController() {
        title = "Настройки"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let newBackButton = UIBarButtonItem(title: "Меню",
                                            style: .plain, target: self, action: #selector(backButtonAction))
        navigationController?.navigationBar.topItem?.backBarButtonItem = newBackButton
        newBackButton.tintColor = UIColor.setColor(lightColor: .white, darkColor: .white)
    }
    
    @objc func backButtonAction() {
        self.navigationController?.dismiss(animated: true)
    }
    
    @objc func darkModeToggleAction(_ toggle: UISwitch) {
        self.settingsPresenter.darkModeToggleAction(toggle)
    }
    
    @objc private func exitButtonDidTapped() {
        self.settingsPresenter.logOut()
    }
    
    private func setupUI() {
        self.view.addSubview(stackWithLabels)
        self.view.addSubview(stackWithToggles)
        self.view.addSubview(exitButton)
        self.darkModeToggle.isOn = UserDefaults.standard.bool(forKey: "darkModeIsOn")
        
        NSLayoutConstraint.activate([
            self.stackWithLabels.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.stackWithLabels.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            self.stackWithToggles.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.stackWithToggles.leadingAnchor.constraint(equalTo: self.stackWithLabels.trailingAnchor, constant: 30),
            
            self.exitButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.exitButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30)
        ])
    }
    
}
