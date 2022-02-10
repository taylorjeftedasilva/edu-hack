//
//  Login.swift
//  Edu Hacking
//
//  Created by Taylor Jefte da silva on 23/01/22.
//

import Foundation
import UIKit
import TextFieldEffects


class Login: UIView {
    
    enum ConstantesDefault {
        
        enum Fonts: String {
            case fontDefault = "Helvetica"
        }
        
    }
    
    @objc var action: ((_ sender: UIAction) -> Void)?
    
    let titleHacking: UILabel = {
        let titleHacking = UILabel()
        titleHacking.textColor = .white
        titleHacking.font = UIFont(name:ConstantesDefault.Fonts.fontDefault.rawValue, size: 50.0) ?? UIFont(name:"ArialRoundedMTBold", size: 50.0)
        titleHacking.numberOfLines = 0
        titleHacking.text = String("Edu\nHacking")
        titleHacking.translatesAutoresizingMaskIntoConstraints = false
        
        return titleHacking
    }()
    
    let stackView: UIStackView = {
       let stc = UIStackView()
        stc.translatesAutoresizingMaskIntoConstraints = false
        return stc
    }()
    
    let userName: HoshiTextField =  {
        let txtView = HoshiTextField()
        txtView.autocapitalizationType = .none
        txtView.placeholderColor = .red
        txtView.placeholder =  "User Name"
        txtView.placeholderFontScale = 1.2
        txtView.translatesAutoresizingMaskIntoConstraints = false
        return txtView
    }()
    
    let password: HoshiTextField =  {
        let txtView = HoshiTextField()
        txtView.placeholderColor = .red
        txtView.autocapitalizationType = .none
        txtView.placeholder =  "Password"
        txtView.placeholderFontScale = 1.2
        txtView.isSecureTextEntry = true
        txtView.backgroundColor = .white
        txtView.translatesAutoresizingMaskIntoConstraints = false
        return txtView
    }()
    
    let button: UIButton =  {
        let bt = UIButton()
        bt.setTitle("submit", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        backgroundColor = .black
        userName.backgroundColor = .white
        password.backgroundColor = .white
        button.backgroundColor = .red
        addSubview(stackView)
        stackView.addSubview(titleHacking)
        stackView.addSubview(userName)
        stackView.addSubview(password)
        stackView.addSubview(button)
        constraints()
    }
    
    func constraints() {
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor),
            
            titleHacking.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 60),
            titleHacking.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            
            userName.topAnchor.constraint(equalTo: titleHacking.bottomAnchor, constant: 90),
            userName.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -90),
            userName.heightAnchor.constraint(equalToConstant: 50),
            userName.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            
            password.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            password.heightAnchor.constraint(equalToConstant: 50),
            password.widthAnchor.constraint(equalTo: userName.widthAnchor),
            password.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            
            button.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 80),
            button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30),
            
        ])
       
    }
    
}


