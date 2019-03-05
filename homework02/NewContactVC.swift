//
//  NewContactVC.swift
//  homework02
//
//  Created by Maria Handschu on 2/18/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

class NewContactVC: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    var contact = Contact()
    var data: String?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //collecting data typed into UI
        var contact = Contact(namePassed: nameField.text, emailPassed: emailField.text, phone: phoneField.text, type: typeSegmentedControl.selectedSegmentIndex)
        
        //sending back data to ViewController
        let destinationVC = segue.destination as! ViewController
        destinationVC.contactList.append(contact)
        
        //passing data to detailsVC
        if segue.identifier == "SegDetails" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.contact = self.contact
            
            
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


