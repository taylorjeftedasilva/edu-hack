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
    
    let segmentElements: UIStackView = {
        let stack = UIStackView()
        let lb = UILabel()
        lb.text = "Top 10 Web Application Security Risks"
        lb.font = UIFont(name: "Roboto-Regular", size: 25) ?? UIFont(name:"ArialRoundedMTBold", size: 25)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.textAlignment = .center
        stack.addSubview(lb)

        let uiImg = UIImageView()
        uiImg.image = UIImage(named: "segment01")
        stack.addSubview(uiImg)
        
        uiImg.translatesAutoresizingMaskIntoConstraints = false
        lb.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lb.widthAnchor.constraint(equalTo: stack.widthAnchor),
            uiImg.widthAnchor.constraint(equalTo: stack.widthAnchor),
            uiImg.topAnchor.constraint(equalTo: lb.bottomAnchor, constant: 20)
        ])
        return stack
    }()
    
    let segmentElementsPercentual: UIStackView = {
        let stack = UIStackView()
        let lb = UILabel()
        lb.text = "Percentual"
        lb.font = UIFont(name: "Roboto-Regular", size: 25) ?? UIFont(name:"ArialRoundedMTBold", size: 25)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.textAlignment = .center
        stack.addSubview(lb)

        let uiImg = UIImageView()
        uiImg.image = UIImage(named: "segment02")
        stack.addSubview(uiImg)
        
        uiImg.translatesAutoresizingMaskIntoConstraints = false
        lb.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lb.widthAnchor.constraint(equalTo: stack.widthAnchor),
            uiImg.widthAnchor.constraint(equalTo: stack.widthAnchor),
            uiImg.topAnchor.constraint(equalTo: lb.bottomAnchor, constant: 20)
        ])
        
        stack.isHidden = true
        return stack
    }()
    
    let segmentControl: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["TOP", "%"])
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font:  UIFont(name: "Roboto-Regular", size: 30) ?? UIFont(name:"ArialRoundedMTBold", size: 30)]
        seg.selectedSegmentIndex = 0
        seg.backgroundColor = UIColor(red: 0.076,green: 0.072,blue: 0.072, alpha: 1.0)
        seg.selectedSegmentTintColor = UIColor(red: 0.252,green: 0.24,blue: 0.24, alpha: 1.0)
        seg.setTitleTextAttributes(titleTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        seg.addTarget(self, action: #selector(actionSegmentControl), for: .valueChanged)
        seg.translatesAutoresizingMaskIntoConstraints = false
        return seg
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
    
    @objc
    func actionSegmentControl (sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
              case 1:
                segmentElementsPercentual.isHidden = false
                segmentElements.isHidden = true
              default:
                segmentElements.isHidden = false
                segmentElementsPercentual.isHidden = true
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
        stackView.addSubview(segmentControl)
        stackView.addSubview(segmentElements)
        stackView.addSubview(segmentElementsPercentual)
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
            top.centerYAnchor.constraint(equalTo: titleSub.bottomAnchor, constant: 100),
            segmentControl.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -60),
            segmentControl.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            segmentControl.topAnchor.constraint(equalTo: top.bottomAnchor, constant: 60),
            segmentControl.heightAnchor.constraint(equalToConstant: 40),
            segmentElements.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 30),
            segmentElements.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant:  -60),
            segmentElements.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            segmentElementsPercentual.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 30),
            segmentElementsPercentual.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant:  -60),
            segmentElementsPercentual.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
        ])
       
    }
    
        

}
