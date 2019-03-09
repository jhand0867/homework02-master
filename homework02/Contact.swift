//
//  Contact.swift
//  homework02
//
//  Created by Maria Handschu on 2/18/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import Foundation

class Contact {
    
    var id: String?
    var name: String?
    var email: String?
    var phoneNum: String?
    var phoneType: String?
    var isDeleted: Bool = false
    
    init() {
        self.id = ""
        self.name = ""
        self.email = ""
        self.phoneNum = ""
        self.phoneType = ""
        
    }
    
    init(_ idPassed: String?, _ namePassed: String?, _ emailPassed: String?, _ phone: String?, _ type: String?){
        self.id = idPassed
        self.name = namePassed
        self.email = emailPassed
        self.phoneNum = phone
        self.phoneType = type
        
    }
}
