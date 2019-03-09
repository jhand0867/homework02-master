//
//  EditViewController.swift
//  homework02
//
//  Created by Olesen, Elizabeth on 2/27/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

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

        //nameTextField.text = 
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //collecting data typed into UI
        let contact = Contact(self.id, nameTextField.text, emailTextField.text, PhoneTextField.text, String(typeSegmentedControl!.selectedSegmentIndex))
        
        //sending back data to ViewController
        let destinationVC = segue.destination as! ViewController
        //destinationVC.contactList.insert(contact, at: )
        
    }
         
    @IBAction func submitClicked(_ sender: Any) {
        print("submitClicked")
        self.dismiss(animated: true)
    }
    

    
}
