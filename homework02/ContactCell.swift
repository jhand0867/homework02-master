//
//  ContactCell.swift
//  homework02
//
//  Created by Olesen, Elizabeth on 2/27/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

protocol ContactCellDelegate {
    func deleteClicked(cell:UITableViewCell)
}

class ContactCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    var delegate: ContactCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        print("ContactCell deleteClicked")
        delegate?.deleteClicked(cell: self)
    }
    
}
