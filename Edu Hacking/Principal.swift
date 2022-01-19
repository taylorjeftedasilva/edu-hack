//
//  Principal.swift
//  Edu Hacking
//
//  Created by Taylor Jefte da silva on 11/01/22.
//

import Foundation
import UIKit


class Principal: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNav()
        configView()
        view.backgroundColor = .black
    }
    
    let stackView: UIStackView = {
        let stc = UIStackView()
        stc.translatesAutoresizingMaskIntoConstraints = false
        return stc
    }()
    
    let titleMain: UILabel = {
        let lb = UILabel()
        lb.text = "TOP 3°"
        lb.font = UIFont(name: "Roboto-Regular", size: 30) ?? UIFont(name:"ArialRoundedMTBold", size: 30.0)
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let titleSub: UILabel = {
        let lb = UILabel()
        lb.text = "Os Três tipos de ataques mais comuns no ano."
        lb.textColor = UIColor(red: 0.983, green: 0.496, blue: 0.496, alpha: 1)
        lb.font = UIFont(name: "Roboto-Regular", size: 14) ?? UIFont(name:"ArialRoundedMTBold", size: 14.0)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let top: UIStackView = {
        let stc = UIStackView()
        stc.translatesAutoresizingMaskIntoConstraints = false
        return stc
    }()
    
    func tracoContinuo() -> UIView {
        
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 60, height: 0)
        view.backgroundColor = .white
        let stroke = UIView()
        stroke.bounds = view.bounds.insetBy(dx: -0.5, dy: -0.5)
        stroke.center = view.center
        stroke.layer.borderWidth = 1
        stroke.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return stroke
    }
    
    func mountTop (_ labels: [String]) {
        var lb: UIStackView? = nil
        for i in labels {
            var stc: UIStackView
            if labels.last != i {
                stc = doTop(i)
            }
            else{
                stc = doTop(i, tc: false)
            }
            top.addSubview(stc)
            stc.widthAnchor.constraint(equalTo: top.widthAnchor).isActive = true
            if lb != nil {
                guard let ns = lb?.bottomAnchor else { return }
                stc.centerYAnchor.constraint(equalTo: ns, constant: 40).isActive = true
            }
            lb = stc
            
        }
        
    }
        
    func doTop(_ s: String, tc: Bool = true) -> UIStackView {
        let stc: UIStackView = UIStackView()
        let lb = UILabel()
        lb.text = s
        lb.textColor = .white
        stc.addSubview(lb)
        let traco = tracoContinuo()
        stc.addSubview(traco)
        traco.centerYAnchor.constraint(equalTo: lb.bottomAnchor, constant: 10).isActive = true
        if !tc {
            traco.isHidden = true
        }
        lb.translatesAutoresizingMaskIntoConstraints = false
        stc.translatesAutoresizingMaskIntoConstraints = false
        return stc
    }
    
    func configNav(){
        navigationController?.isToolbarHidden = true
        navigationItem.hidesBackButton = true
    }
    
    func configView(){
        mountTop(["1° DDOS","2° DDOS","3° DDOS"])
        stackView.addSubview(titleMain)
        stackView.addSubview(titleSub)
        stackView.addSubview(top)
        view.addSubview(stackView)
        configLayoutViews()
    }
    
    func configLayoutViews(){
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor),
            titleMain.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            titleMain.centerYAnchor.constraint(equalTo: stackView.topAnchor, constant: 30),
            titleSub.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            titleSub.centerYAnchor.constraint(equalTo: titleMain.bottomAnchor, constant: 15),
            top.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -60),
            top.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            top.centerYAnchor.constraint(equalTo: titleSub.bottomAnchor, constant: 100)
        ])
       
    }
        

}
