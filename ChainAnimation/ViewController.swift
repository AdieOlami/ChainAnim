//
//  ViewController.swift
//  ChainAnimation
//
//  Created by Olar's Mac on 3/23/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.text = "Initial Text"
        firstLabel.textAlignment = .center
        firstLabel.numberOfLines = 0
        firstLabel.font = UIFont.boldSystemFont(ofSize: 17)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        return firstLabel
    }()
    
    let secondLabel: UILabel = {
       let seclabel = UILabel()
        seclabel.text = "Second Label"
        seclabel.textAlignment = .center
        seclabel.numberOfLines = 0
        seclabel.font = UIFont.boldSystemFont(ofSize: 25)
        seclabel.translatesAutoresizingMaskIntoConstraints = false
        return seclabel
    }()
    
    let firstButton: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("First Button", for: .normal)
        return btn
    }()
    
    let thirdButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.setTitle("Second Button", for: .normal)
        return btn
    }()
    
    let secondButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .brown
        btn.setTitle("Third Button", for: .normal)
        return btn
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        positionUI()
        
    }
    
    func positionUI() {
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(thirdButton)
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateUI)))
    }
    
    @objc
    fileprivate func animateUI() {
        firstLabel.baseAnimate()
        secondLabel.animateChanined()
        firstButton.animateMomentum()
        secondButton.animateRotate()
        thirdButton.animateColor()
        
    }


}

