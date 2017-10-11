//
//  CustomView.swift
//  Engaginbiz
//
//  Created by Bhavin on 07/09/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit

class CustomView: UIView {

    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 58/255, green: 128/255, blue: 188/255, alpha: 1)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.restorationIdentifier="loginbutton"
        
      //  button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    
}
