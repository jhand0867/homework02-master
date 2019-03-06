//
//  DetailsViewController.swift
//  homework02
//
//  Created by Maria Handschu on 2/21/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var contact: Contact?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    @IBOutlet weak var phoneType: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        if contact != nil {
        self.nameLabel.text = contact!.name!
        self.emailLabel.text = contact!.email!
        self.phoneNum.text = contact!.phoneNum!
        self.phoneType.text = String(contact!.phoneType!)
        
//        if contact!.phoneType == 0 {
//            phoneType.text = "Cell"
//        }
//        else if contact!.phoneType == 1 {
//            phoneType.text = "Home"
//        } else {
//            phoneType.text = "Office"
//        }
        }

        
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        print("deleteclicked")
        self.dismiss(animated: true)
    }
    
    
}
