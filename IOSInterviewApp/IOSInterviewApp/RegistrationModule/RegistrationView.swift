//
//  RegistrationView.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

protocol RegistrationViewDelegate: AnyObject {
    func closeButtonAction()
    func registerButtonAction()
}

class RegistrationView: UIView {
    
    // MARK: - Properties
    
    weak var registrationViewDelegate: RegistrationViewDelegate?
    
    private(set) lazy var registrationButton: UIButton = {
        var button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registrationButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func registrationButtonDidTapped() {
        registrationViewDelegate?.registerButtonAction()
    }
    
    private(set) lazy var passwordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 15
        
        stack.addArrangedSubview(passwordLabel)
        stack.addArrangedSubview(smallPasswordStack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private(set) lazy var smallPasswordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 5
        
        stack.addArrangedSubview(passwordTF)
        stack.addArrangedSubview(passwordView)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private(set) lazy var passwordView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите пароль"
        tf.isSecureTextEntry = true
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        return tf
    }()
    
    private(set) lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private(set) lazy var loginStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 15
        
        stack.addArrangedSubview(loginLabel)
        stack.addArrangedSubview(smallLoginStack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private(set) lazy var smallLoginStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 5
        
        stack.addArrangedSubview(loginTF)
        stack.addArrangedSubview(loginView)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private(set) lazy var loginView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var loginTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите логин"
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        return tf
    }()
    
    private(set) lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private(set) lazy var nameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 15
        
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(smallNameStack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private(set) lazy var smallNameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 5
        
        stack.addArrangedSubview(nameTF)
        stack.addArrangedSubview(nameView)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private(set) lazy var nameView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите ваше имя"
        return tf
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private(set) lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.fill.badge.plus"), for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 30
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private(set) lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func closeButtonDidTapped() {
        registrationViewDelegate?.closeButtonAction()
    }
    
    private(set) lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = .purple
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        self.addSubview(topView)
        self.addSubview(closeButton)
        self.addSubview(loginButton)
        self.addSubview(registrationLabel)
        self.addSubview(nameStack)
        self.addSubview(loginStack)
        self.addSubview(passwordStack)
        self.addSubview(registrationButton)

        NSLayoutConstraint.activate([
            self.registrationButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 50),
            self.registrationButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registrationButton.widthAnchor.constraint(equalToConstant: 170),
            self.registrationButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.passwordStack.topAnchor.constraint(equalTo: self.loginStack.bottomAnchor, constant: 40),
            self.passwordStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.passwordStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.smallPasswordStack.widthAnchor.constraint(equalTo: self.passwordStack.widthAnchor),
            
            self.passwordView.heightAnchor.constraint(equalToConstant: 2),
            self.passwordView.widthAnchor.constraint(equalTo: self.smallPasswordStack.widthAnchor),
            
            self.loginStack.topAnchor.constraint(equalTo: self.nameStack.bottomAnchor, constant: 40),
            self.loginStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.smallLoginStack.widthAnchor.constraint(equalTo: self.loginStack.widthAnchor),
            
            self.loginView.heightAnchor.constraint(equalToConstant: 2),
            self.loginView.widthAnchor.constraint(equalTo: self.smallLoginStack.widthAnchor),
            
            self.nameStack.topAnchor.constraint(equalTo: self.registrationLabel.bottomAnchor, constant: 40),
            self.nameStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.nameStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.smallNameStack.widthAnchor.constraint(equalTo: self.nameStack.widthAnchor),
            
            self.nameView.heightAnchor.constraint(equalToConstant: 2),
            self.nameView.widthAnchor.constraint(equalTo: self.smallNameStack.widthAnchor),
            
            self.registrationLabel.topAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: 50),
            self.registrationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.loginButton.topAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: -28),
            self.loginButton.widthAnchor.constraint(equalToConstant: 60),
            self.loginButton.heightAnchor.constraint(equalToConstant: 60),
            self.loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.closeButton.topAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: -28),
            self.closeButton.widthAnchor.constraint(equalToConstant: 60),
            self.closeButton.heightAnchor.constraint(equalToConstant: 60),
            self.closeButton.trailingAnchor.constraint(equalTo: self.loginButton.leadingAnchor, constant: 0),
            
            self.topView.topAnchor.constraint(equalTo: self.topAnchor),
            self.topView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.topView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
}
