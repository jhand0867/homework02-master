//
//  Contact.swift
//  homework02
//
//  Created by Maria Handschu on 2/18/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import Foundation

class Contact {
    
    var name: String?
    var email: String?
    var phoneNum: String?
    var phoneType: Int?
    var isDeleted: Bool = false
    
    init() {
        self.name = ""
        self.email = ""
        self.phoneNum = ""
        self.phoneType = 0
        
    }
    
    init(_ namePassed: String?, _ emailPassed: String?, _ phone: String?, _ type: Int?){
        self.name = namePassed
        self.email = emailPassed
        self.phoneNum = phone
        self.phoneType = type
        
    }
}
