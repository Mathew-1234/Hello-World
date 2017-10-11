//
//  Proposal.swift
//  Engaginbiz
//
//  Created by Bhavin on 08/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import Foundation


//this is the class when a user selects the options from a the available fields after clicking on the "Select intent" button and it would be stored in this format on the firebase. Some initialisers needed to be set.


class Proposal {
    var fromId: String?
    var toId: String?
    var category: Category?
    var type: proposalType?
    var status: Bool?
}
