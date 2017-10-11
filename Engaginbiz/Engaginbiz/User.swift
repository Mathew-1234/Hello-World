//
//  User.swift
//  round
//
//  Created by Bhavin on 06/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import Foundation

// Base class for the user
class User {

    
    var fname: String?
    var lname: String?
    var bio: String?
    var profileTitle: profileTitle?
    var profileImage: String?
    var gender: Gender?
    var dob: String?
    var socialLinks: [Social]?
    var intents: [Category]!
    var categoryCount: Int?
    var online: Bool?
    
    // Initializer for the class
    init(fname: String,lname: String, bio: String,profileTitle: profileTitle,profileImage: String,gender: Gender,dob: String) {
        self.fname = fname
        self.lname = lname
        self.bio = bio
        self.profileTitle = profileTitle
        self.gender = gender
        self.profileImage = profileImage
        self.dob = dob
        self.online = true
        self.intents = [Category]()
        self.socialLinks = [Social]()
        self.categoryCount = 0
    }
    
    init() {
        self.fname = "dummy"
        self.lname = "dummy"
        self.bio = "dummy"
        self.profileTitle = .Professor
        self.gender = .male
        self.profileImage = "dummy"
        self.dob = "dummy"
        self.online = true
        self.intents = [Category]()
        self.socialLinks = [Social]()
        self.categoryCount = 0
    }
    
    // To store the information in the social variable
    func setSocialLinks(_ dictionaryForSocialLinks : [String: Any]) -> Void {
        
        let social = Social(name: dictionaryForSocialLinks["name"]! as! String,link: dictionaryForSocialLinks["link"]! as! String, status: dictionaryForSocialLinks["status"]! as! Bool)
        //setting up the socialLink Array
        self.socialLinks?.append(social)
        return
    }
    
    // To store the information in the category variables
    func setCategories(_ dictionaryForCategory: [String: Any]){
        let category = Category(type: dictionaryForCategory["type"] as! String, status: dictionaryForCategory["status"] as! Bool, options: dictionaryForCategory["options"] as! [String])
        
        //setting up the intents Array
        self.intents?.append(category)
        self.categoryCount = self.categoryCount! + 1
        return
    }
}
