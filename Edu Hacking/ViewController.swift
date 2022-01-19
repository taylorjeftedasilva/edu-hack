//
//  ViewController.swift
//  Edu Hacking
//
//  Created by Taylor Jefte da silva on 21/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var titleHacking = UILabel()
    var iconHacking = UIImageView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configTitle()
        configImage()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: { [weak self] in
            let vw: Principal = Principal()
            self?.navigationController?.pushViewController(vw, animated: true)
        })
    }


    func configTitle() {
        self.titleHacking.textColor = .white
        titleHacking.font = UIFont(name:"Roboto-Black", size: 50.0) ?? UIFont(name:"ArialRoundedMTBold", size: 50.0)
        self.titleHacking.numberOfLines = 0
        self.titleHacking.text = String("Edu\nHacking")
        view.addSubview(titleHacking)
        self.titleHacking.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsTitle()
    }
    
    func configImage() {
        iconHacking.image = UIImage(named: "hack")
        view.addSubview(iconHacking)
        self.iconHacking.translatesAutoresizingMaskIntoConstraints = false
        setConstraintImage()
    }
    
    func setConstraintsTitle() {
        self.titleHacking.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.titleHacking.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    func setConstraintImage() {
        self.iconHacking.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.iconHacking.centerYAnchor.constraint(equalTo: titleHacking.bottomAnchor, constant: 139).isActive = true
        
        self.iconHacking.widthAnchor.constraint(equalToConstant: 240).isActive = true
        self.iconHacking.heightAnchor.constraint(equalToConstant: 206).isActive = true
    }
}

