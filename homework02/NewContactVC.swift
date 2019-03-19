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
        
        let destinationVC = segue.destination as! ViewController
        destinationVC.newContact = contact
        
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


