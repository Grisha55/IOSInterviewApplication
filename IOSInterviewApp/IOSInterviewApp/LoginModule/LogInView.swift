//
//  LogInView.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

protocol LogInViewDelegate: AnyObject {
    func loginButtonAction()
    func closeButtonAction()
}

class LogInView: UIView {
    
    // MARK: - Properties
    
    weak var logInViewDelegate: LogInViewDelegate?
    
    private(set) lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func loginButtonDidTapped() {
        logInViewDelegate?.loginButtonAction()
    }
    
    private(set) lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 30
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func closeButtonDidTapped() {
        logInViewDelegate?.closeButtonAction()
    }
    
    private(set) lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var passwordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 10
        
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
        tf.attributedPlaceholder = NSAttributedString(string: "Введите пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private(set) lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.textColor = .white
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
        tf.attributedPlaceholder = NSAttributedString(string: "Введите логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    private(set) lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private(set) lazy var logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .purple
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        self.addSubview(logInLabel)
        self.addSubview(loginStack)
        self.addSubview(passwordStack)
        self.addSubview(logInButton)
        self.addSubview(bottomView)
        self.addSubview(closeButton)
        self.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            self.loginButton.widthAnchor.constraint(equalToConstant: 60),
            self.loginButton.heightAnchor.constraint(equalToConstant: 60),
            self.loginButton.trailingAnchor.constraint(equalTo: self.closeButton.leadingAnchor),
            self.loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22),
            
            self.closeButton.widthAnchor.constraint(equalToConstant: 60),
            self.closeButton.heightAnchor.constraint(equalToConstant: 60),
            self.closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22),
            
            self.bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.bottomView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.bottomView.heightAnchor.constraint(equalToConstant: 50),
            
            self.logInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logInButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 50),
            self.logInButton.heightAnchor.constraint(equalToConstant: 40),
            self.logInButton.widthAnchor.constraint(equalToConstant: 100),
            
            self.passwordStack.topAnchor.constraint(equalTo: self.loginStack.bottomAnchor, constant: 30),
            self.passwordStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.passwordStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.smallPasswordStack.widthAnchor.constraint(equalTo: self.passwordStack.widthAnchor),
            
            self.passwordView.widthAnchor.constraint(equalTo: self.smallPasswordStack.widthAnchor),
            self.passwordView.heightAnchor.constraint(equalToConstant: 2),
            
            self.loginStack.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 40),
            self.loginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.smallLoginStack.widthAnchor.constraint(equalTo: self.loginStack.widthAnchor),
            
            self.loginView.widthAnchor.constraint(equalTo: self.smallLoginStack.widthAnchor),
            self.loginView.heightAnchor.constraint(equalToConstant: 2),
            
            self.logInLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.logInLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        ])
    }
}
