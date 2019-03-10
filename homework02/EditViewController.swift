//
//  EditViewController.swift
//  homework02
//
//  Created by Olesen, Elizabeth on 2/27/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit
import Alamofire

class EditViewController: UIViewController {

    var contact: Contact?
    var data: String?
    var id: String = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = contact?.name!
        emailTextField.text = contact?.email!
        PhoneTextField.text = contact?.phoneNum!
        switch contact?.phoneType! {
        case "Office":
            typeSegmentedControl.selectedSegmentIndex = 2
        case "Home":
            typeSegmentedControl.selectedSegmentIndex = 1
        default:
            typeSegmentedControl.selectedSegmentIndex = 0
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        var type = ""
        switch typeSegmentedControl.selectedSegmentIndex {
        case 2:
            type = "Office"
        case 1:
            type = "Home"
        default:
            type = "Cell"
        }
        
        //collecting data typed into UI
        let contact = Contact(self.id, nameTextField.text, emailTextField.text, PhoneTextField.text, type)
        
        //sending back data to ViewController
        let destinationVC = segue.destination as! ViewController
        //TODO:  update contact
        //destinationVC.contactList.insert(contact, at: )
        
        
        
        //Upadating the server
        var parameters: Parameters = ["name": contact.name!,
                                      "email": contact.email!,
                                      "phone": contact.phoneNum!,
                                      "type": contact.phoneType!]
        
        AF.request("http://ec2-18-234-222-229.compute-1.amazonaws.com/contact/update", method: .post  , parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseString { (response) in
            
            
        }
        
    }
         
    @IBAction func submitClicked(_ sender: Any) {
        print("submitClicked")
        self.dismiss(animated: true)
    }
    

    
}
