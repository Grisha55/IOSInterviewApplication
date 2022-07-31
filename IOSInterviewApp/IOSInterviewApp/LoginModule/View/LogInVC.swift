//
//  LogInVC.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class LogInVC: UIViewController {

    // MARK: - Properties
    let disposeBag = DisposeBag()
    var loginViewModel: LoginViewModel!
    var customWaveView: CustomWaveView!
    let dr: TimeInterval = 10.0
    var timer: Timer?
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 30
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var passwordStack: UIStackView = {
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
    
    lazy var smallPasswordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 5
        
        stack.addArrangedSubview(passwordTF)
        stack.addArrangedSubview(passwordView)
        return stack
    }()
    
    lazy var passwordView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Введите пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var loginStack: UIStackView = {
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
    
    lazy var smallLoginStack: UIStackView = {
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
    
    lazy var loginView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loginTF: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Введите логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func loadView() {
        super.loadView()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            let dr = CGFloat(1.0 / (self.dr / 0.01))
            
            self.customWaveView.progress += dr
            self.customWaveView.setupProgress(self.customWaveView.progress)
            
            if self.customWaveView.progress >= 0.95 {
                self.timer?.invalidate()
                self.timer = nil
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                    guard let self = self else { return }
                    self.customWaveView.percentAnimation()
                }
            }
        })
        UserDefaults.standard.set(false, forKey: "darkModeIsOn")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        setupUI()
        loginViewModel.skipingAuthIfUserIs()
        bind()
    }
    
    private func bind() {
        let input = LoginViewModel.Input(
            login: loginTF.rx.text.asDriver(),
            password: passwordTF.rx.text.asDriver(),
            validate: logInButton.rx.tap.asDriver(),
            close: closeButton.rx.tap.asDriver())
        
        let output = loginViewModel.transform(input)
        
        output.shouldHideButton
            .bind(to: logInButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    private func setupUI() {
        view.addSubview(logInLabel)
        view.addSubview(loginStack)
        view.addSubview(passwordStack)
        view.addSubview(logInButton)
        view.addSubview(bottomView)
        view.addSubview(closeButton)
        view.addSubview(loginButton)
        view.addSubview(customWaveView)
        customWaveView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.loginButton.widthAnchor.constraint(equalToConstant: 60),
            self.loginButton.heightAnchor.constraint(equalToConstant: 60),
            self.loginButton.trailingAnchor.constraint(equalTo: self.closeButton.leadingAnchor),
            self.loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -22),
            
            self.closeButton.widthAnchor.constraint(equalToConstant: 60),
            self.closeButton.heightAnchor.constraint(equalToConstant: 60),
            self.closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.closeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -22),
            
            self.bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.bottomView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.bottomView.heightAnchor.constraint(equalToConstant: 50),
            
            self.logInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logInButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 50),
            self.logInButton.heightAnchor.constraint(equalToConstant: 40),
            self.logInButton.widthAnchor.constraint(equalToConstant: 100),
            
            self.passwordStack.topAnchor.constraint(equalTo: self.loginStack.bottomAnchor, constant: 30),
            self.passwordStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.passwordStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            self.smallPasswordStack.widthAnchor.constraint(equalTo: self.passwordStack.widthAnchor),
            
            self.passwordView.widthAnchor.constraint(equalTo: self.smallPasswordStack.widthAnchor),
            self.passwordView.heightAnchor.constraint(equalToConstant: 2),
            
            self.loginStack.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 40),
            self.loginStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.loginStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.smallLoginStack.widthAnchor.constraint(equalTo: self.loginStack.widthAnchor),
            
            self.loginView.widthAnchor.constraint(equalTo: self.smallLoginStack.widthAnchor),
            self.loginView.heightAnchor.constraint(equalToConstant: 2),
            
            self.logInLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.logInLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            self.customWaveView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.customWaveView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.customWaveView.widthAnchor.constraint(equalToConstant: 200),
            self.customWaveView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
