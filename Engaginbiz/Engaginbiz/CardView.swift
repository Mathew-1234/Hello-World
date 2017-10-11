//
//  CardView.swift
//  Engaginbiz
//
//  Created by Bhavin on 06/09/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import Foundation
import UIKit
import Cartography


protocol SomeUIViewDelegate {
    func segueFunction() //this function will be in your receiving class
}


class CardView: UIView {
  //  @IBOutlet weak var badge: UIImageView!
    
    var delegate: SomeUIViewDelegate?
    
    @IBOutlet weak var profileButton: UIButtonX!
    

    @IBOutlet weak var nameLabel: UILabel!
    
    var pressed: Bool!


    
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
        
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    @IBAction func openDetailViewController(_ sender: UIButton) {
        print("Button tapped")
        pressed = true
        delegate?.segueFunction()
        
       // performSegue(withIdentifier: "detailsegue", sender: nil)
    }
    
    
    func setup() {
        // Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        // Corner Radius
        layer.cornerRadius = 10.0;
        //profileButton.layer.cornerRadius = 10.0
        
        
        
        
        
    }
    
    func handleLoginRegister(){
        print("HI")
    }
}
