//
//  Launch.swift
//  Edu Hacking
//
//  Created by Taylor Jefte da silva on 23/01/22.
//

import Foundation
import UIKit


class Launch: UIView{
    
    enum ConstantesDefault {
        
        enum Fonts: String {
            case fontDefault = "Helvetica"
        }
        
    }
    
    var titleHacking = UILabel()
    var iconHacking = UIImageView()
    
    override init(frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)) {
        super.init(frame: frame)
        configTitle()
        configImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configTitle() {
        self.titleHacking.textColor = .white
        titleHacking.font = UIFont(name: ConstantesDefault.Fonts.fontDefault.rawValue , size: 50.0) ?? UIFont(name:"ArialRoundedMTBold", size: 50.0)
        self.titleHacking.numberOfLines = 0
        self.titleHacking.text = String("Edu\nHacking")
        self.addSubview(titleHacking)
        self.titleHacking.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsTitle()
    }
    
    func configImage() {
        iconHacking.image = UIImage(named: "hack")
        self.addSubview(iconHacking)
        self.iconHacking.translatesAutoresizingMaskIntoConstraints = false
        setConstraintImage()
    }
    
    func setConstraintsTitle() {
        self.titleHacking.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        self.titleHacking.centerYAnchor.constraint(equalTo: topAnchor, constant: 200).isActive = true
    }
    
    func setConstraintImage() {
        self.iconHacking.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        self.iconHacking.centerYAnchor.constraint(equalTo: titleHacking.bottomAnchor, constant: 139).isActive = true
        
        self.iconHacking.widthAnchor.constraint(equalToConstant: 240).isActive = true
        self.iconHacking.heightAnchor.constraint(equalToConstant: 206).isActive = true
    }
    
}
