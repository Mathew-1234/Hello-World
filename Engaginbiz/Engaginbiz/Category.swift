//
//  Categories.swift
//  Engaginbiz
//
//  Created by Bhavin on 08/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import Foundation

enum categoryOptions {
    case Sports, Health, Education, Finance, Social
}

//struct for category. It is the structure to store and display the information whenever the user clicks on the "Select the intent of connection button"

struct Category {
    var name: String?
    var type: categoryType?
    var typeString: String?
    var optionsString = [String]()
    var options: [categoryOptions]?
    var status: Bool?
    
    init(type: String, status: Bool, options: [String]) {
        self.status = status
        self.typeString = type
       // self.optionsString = [String]()
        self.optionsString = options
        self.options = [categoryOptions]()
        
        setupType(self.typeString!)
        //setupOptions(self.optionsString!)
    }
    
    // It stores the info of the category in the perfect format
    
    mutating func setupType(_ typeString: String){
        switch typeString {
        case "fieldOfWork":
            self.type = .fieldOfWork
            self.name = "My Field Of Work"
        case "myIndustry":
            self.type = .myIndustry
            self.name = "My Industry"
        case "likeToSponsorFor":
            self.type = .likeToSponserFor
            self.name = "I would like to sponsor for"
        case "likeToInvestIn":
            self.type = .likeToInvestIn
            self.name = "I would like to invest in"
        case "likeToVolunteerFor":
            self.type = .likeToVolunteerFor
            self.name = "I would like to volunteer for"
        case "otherFieldsOfInterest":
            self.type = .otherFieldsOfInterest
            self.name = "Other Fields of interest"
        case "invitingSponsorsFor":
            self.type = .invitingSponsorsFor
            self.name = "Inviting sponsors for"
        case "lookingIndustryExpertsIn":
            self.type = .lookingIndustryExpertsIn
            self.name = "Looking For industry experts in"
        case "invitingVolunteersFor":
            self.type = .invitingVolunteersFor
            self.name = "Inviting volunteers For"
        case "invitingInvestmentFor":
            self.type = .invitingInvestmentFor
            self.name = "Inviting investment in"
        default:
            self.type = .fieldOfWork
            self.name = "My field of Work"
        }
    }
    
}
