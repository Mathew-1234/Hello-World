//
//  ViewController.swift
//  Engaginbiz
//
//  Created by Bhavin on 07/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bioField: UITextView!
   
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var intentButton: UIButtonX!
    @IBOutlet weak var recommendButton: UIButtonX!
    
    var user1: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Here I have created a dummy user
        //with basic profile info
        
        
        user1 = User(fname: "Bhavin", lname: "Agarwal", bio: "hi there", profileTitle: .Professor, profileImage: "hi there", gender: .male, dob: "12/12/1996")
        let dictionaryForCategories1: [String: Any] = ["type": "likeToSponsorFor", "status": true, "options": ["Sports", "Health"]]
        let dictionaryForCategories3: [String: Any] = ["type": "likeToVolunteerFor", "status": true, "options": ["Sports", "Education"]]
        let dictionaryForCategories4: [String: Any] = ["type": "likeToVolunterFor", "status": true, "options": ["Sports", "Education"]]
        user1?.setCategories(dictionaryForCategories1)
        //print(user1?.intents[0].optionsString)
        user1?.setCategories(dictionaryForCategories3)
        user1?.setCategories(dictionaryForCategories4)
        
        let user2 = User(fname: "Peter", lname: "Agarwal", bio: "hi there", profileTitle: .Teacher, profileImage: "hi there", gender: .male, dob: "12/12/1996")
        let dictionaryForCategories2: [String: Any] = ["type": "likeToVolunteerFor", "status": true, "options": ["Sports", "Finance"]]
        user2.setCategories(dictionaryForCategories2)
        
        
        //#MARK  Here I have added the name and bio which I have created above
        
        fullNameLabel.text = "Bhavin"
        bioField.text = "HI"
        
        setupButtonAlpha()
        bioField.layer.cornerRadius = 5
        bioField.layer.masksToBounds = bioField.layer.cornerRadius > 0
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func intentButtonPressed(_ sender: UIButtonX) {
        
        //performSegue(withIdentifier: "pagesegue", sender: sender)
        
        
    }
    
    @IBAction func recommendButtonPressed(_ sender: UIButtonX) {
    }
    
    private func setupButtonAlpha(){
        
    }
    
}

