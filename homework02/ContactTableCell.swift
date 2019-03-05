//
//  ContactTableCell.swift
//  homework02
//
//  Created by Maria Handschu on 2/18/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

class ContactTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumLbl: UILabel!
    @IBOutlet weak var phoneTypeLbl: UILabel!
    
    func populateCell(contact: Contact) {
        nameLabel.text = contact.name
        emailLabel.text = contact.email
        phoneNumLbl.text = contact.phoneNum
        
        if contact.phoneType == 0 {
            phoneTypeLbl.text = "Cell"
        }
       else if contact.phoneType == 1 {
            phoneTypeLbl.text = "Home"
        } else {
            phoneTypeLbl.text = "Office"
        }
    

    }
}
