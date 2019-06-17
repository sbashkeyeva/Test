//
//  ViewController.swift
//  RegisterPage
//
//  Created by Symbat Bashkeyeva on 6/17/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let rightButton = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreTapped))
        navigationItem.setRightBarButton(rightButton, animated: false)
        setupStyle()
        setupSubviews()
        setupConstraints()
    }
    @objc func moreTapped() {
        
    }
   
    let stackView=UIStackView()
    let phoneTextField = UITextField(frame: CGRect(x: 10.0, y: 100.0, width: UIScreen.main.bounds.width, height: 50.0))
    let passwordTextField = UITextField(frame: CGRect(x: 10.0, y: 150.0, width: UIScreen.main.bounds.width, height: 50.0))
    let label = UILabel()
    let labelDescription = UILabel()
    let button = UIButton()
    let refreshLabel = UILabel()
    let registLabel = UILabel()
    func setupConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        constraints += [

            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            phoneTextField.widthAnchor.constraint(equalToConstant: 300),
            phoneTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 100),
            refreshLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 40)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    func setupSubviews(){
        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(labelDescription)
        stackView.addArrangedSubview(phoneTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(refreshLabel)
        stackView.addArrangedSubview(registLabel)
    }
    func setupStyle(){
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        label.text = "Войти"
        label.font = UIFont.boldSystemFont(ofSize:40)
        labelDescription.text = "Чтобы продолжить, введите ваш логин и пароль"
        phoneTextField.placeholder = "Введите свой номер"
        phoneTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.placeholder = "Введите пароль"
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        refreshLabel.text = "Восстановить пароль"
        refreshLabel.textAlignment = .center
        refreshLabel.textColor = .red
        registLabel.textColor = .red
        registLabel.text = "Регистрация"
        registLabel.textAlignment = .center
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func phoneTextField() {
//        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 250, width: 350, height: 40))
//        sampleTextField.placeholder = "Введите ваш номер"
//        sampleTextField.becomeFirstResponder()
//        sampleTextField.font = UIFont.systemFont(ofSize: 15)
//        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
//        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
//        sampleTextField.keyboardType = UIKeyboardType.default
//        sampleTextField.returnKeyType = UIReturnKeyType.done
//        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
//        sampleTextField.delegate = self as? UITextFieldDelegate
//        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.view.addSubview(sampleTextField)
//    }
//    func passwordTextField() {
//        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 300, width: 350, height: 40))
//        sampleTextField.placeholder = "Введите пароль"
//        sampleTextField.font = UIFont.systemFont(ofSize: 15)
//        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
//        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
//        sampleTextField.keyboardType = UIKeyboardType.default
//        sampleTextField.returnKeyType = UIReturnKeyType.done
//        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
//        sampleTextField.delegate = self as? UITextFieldDelegate
//        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.view.addSubview(sampleTextField)
//    }
//    func button() {
//        let button = UIButton()
//        button.backgroundColor = .red
//        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 400)
//        self.view.addSubview(button)
//    }

   

}

