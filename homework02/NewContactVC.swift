//
//  NewContactVC.swift
//  homework02
//
//  Created by Maria Handschu on 2/18/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class NewContactVC: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    var contact = Contact()
    var data: String?
    var id: String = ""
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print ("shouldPerformSegue")
        
        let toShow = "Invalid Contact"
        var toSay = ""
        let toTell = "Plese correct"
        if nameField!.text! != "" &&
            emailField!.text! != "" &&
            phoneField!.text! != "" {
            return true
        } else {
            
            if nameField!.text! == "" {
                toSay = toSay + "Name "
            }
            if emailField!.text! == "" {
                toSay = toSay + " Email "
            }
            if phoneField!.text! == "" {
                toSay = toSay + " Phone "
            }
            toSay = toSay + " is/are Invalid "
            
            msgBox(viewController: self, toShow: toShow, toSay: toSay, toTell: toTell)
            return false
        }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       print ("prepare for")
        //collecting data typed into UI
        var type = ""
        switch typeSegmentedControl.selectedSegmentIndex {
        case 2:
            type = "Office"
        case 1:
            type = "Home"
        default:
            type = "Cell"
        }
        
        let contact = Contact(self.id, nameField.text, emailField.text, phoneField.text, type)
        
        //Upadating the server
        var parameters: Parameters = ["name": contact.name!,
                                      "email": contact.email!,
                                      "phone": contact.phoneNum!,
                                      "type": contact.phoneType!]
        
        AF.request("http://ec2-18-234-222-229.compute-1.amazonaws.com/contact/create", method: .post  , parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseString { (response) in
            print("Out \(response.response?.statusCode)")
            print ("request ")
            if response.response?.statusCode == 200 {
                print("In \(response.response?.statusCode)")
                //sending back data to ViewController
                let destinationVC = segue.destination as! ViewController
                destinationVC.contactList.append(contact)
                
                msgBox(viewController: self, toShow: "Add Contact", toSay: "Added Successfuly", toTell: "Thanks!")
                
                //passing data to detailsVC
//                if segue.identifier == "SegDetails" {
//                    let destinationVC = segue.destination as! DetailsViewController
//                    destinationVC.contact = self.contact
//                }
                

            } 
        }
     
    }
   
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var contact = Contact(namePassed: nameField.text, emailPassed: emailField.text, phone: phoneField.text, type: typeSegmentedControl.selectedSegmentIndex)
    
        //passing data to DetailsViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}


