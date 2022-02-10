//
//  ViewController.swift
//  Edu Hacking
//
//  Created by Taylor Jefte da silva on 21/12/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let launch = Login()
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIsAuthenticate()
        launch.button.addTarget(self, action: #selector(actionPush), for: .touchDown)
        setConstraint()
    }


    func setConstraint() {
        view.addSubview(launch)
        self.launch.translatesAutoresizingMaskIntoConstraints = false
        self.launch.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.launch.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        self.launch.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func userIsAuthenticate() {
        guard let user = userDefault.string(forKey: "user") else { return }
        guard let password = userDefault.string(forKey: "password") else { return }
        print("User: " + user)
        print("Password: " + password)
        validateLogin(user, password)
    }
    
    func validateLogin(_ user: String,_ password: String){
        
        if(user == "user123" && password == "password") {
            userDefault.set(user, forKey: "user")
            userDefault.set(password, forKey: "password")
            navigationController?.pushViewController(TabBarViewController(), animated: true)
        }else {
            print("Usuario ou Senha invalido")
        }
    }
    
    @objc func actionPush(_ sender: UIAction) {
        guard let user = launch.userName.text else { return }
        guard let password = launch.password.text else { return }
        validateLogin(user, password)
        
    }
}

