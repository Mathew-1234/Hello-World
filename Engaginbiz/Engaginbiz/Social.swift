//
//  Social.swift
//  Engaginbiz
//
//  Created by Bhavin on 08/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import Foundation


// structure for storing the social links along with a status flag to store whether the social link has to be shown or not

struct Social {
    var name: String?
    var link: String?
    var Status: Bool?
    
    init(name: String, link: String, status: Bool) {
        self.name = name
        self.link = link
        self.Status = status
    }
}
