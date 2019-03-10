//
//  DetailsViewController.swift
//  homework02
//
//  Created by Maria Handschu on 2/21/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {
    
    var contact: Contact?
    var selectedRow: Int?
    
    
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
        
        let contactId = contact?.id
        let parameters: Parameters = ["id":contactId!]

        AF.request("http://ec2-18-234-222-229.compute-1.amazonaws.com/contact/delete", method:.post  , parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseString { (response) in
                   self.dismiss(animated: true)
        }

    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        let dest = segue.destination as! EditViewController
        dest.contact = self.contact
        
    }

    
}
