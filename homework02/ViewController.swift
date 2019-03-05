//
//  ViewController.swift
//  homework02
//
//  Created by Maria Handschu on 2/18/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var contactList:  [Contact] = []//saves an empty array
    var newContact = Contact()//saves contact info from newContactVC
    var selectedRow = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print( "viewDidLoad" )
        let cellNib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "mycell")
    }
    
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear")
        tableView.reloadData()
    }

  
  
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSeg" {
            
            let dest = segue.destination as! DetailsViewController
            dest.contact = self.newContact
        }
    }
    
    
    @IBAction func goBack(unwindSegue: UIStoryboardSegue) {
        print("unwind segue with identifier \(unwindSegue.identifier) called")
        
        if unwindSegue.identifier == "addContactSegue" {
            contactList.append(newContact)
        }
        
        if unwindSegue.identifier == "DetailsSeg" {
            print("detailsseg")
        }
        if unwindSegue.identifier == "EditSeg" {
            print("editseg")
        }
        
    }
}

extension ViewController: ContactCellDelegate{
    func deleteClicked(cell: UITableViewCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        self.contactList.remove(at: (indexPath?.row)!)
         print(" \(indexPath!) deleted")
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! ContactCell
        
        let contact = contactList[indexPath.row]
        self.newContact = contact
        
        let name = cell.nameLabel as! UILabel
        let email = cell.emailLabel as! UILabel
        let phone = cell.phoneLabel as! UILabel
        let phoneType = cell.typeLabel as! UILabel
        
        name.text = contact.name
        email.text = contact.email
        phone.text = contact.phoneNum
        phoneType.text = String(contact.phoneType!)
       
        if contact.phoneType == 0 {
            phoneType.text = "Cell"
        }
        else if contact.phoneType == 1 {
            phoneType.text = "Home"
        } else {
            phoneType.text = "Office"
        }

        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newContact = contactList[indexPath.row]
//      let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        print("Selected row\(newContact)")
        performSegue(withIdentifier: "DetailsSeg", sender: nil)
        selectedRow = indexPath.row

    
    }
    
}


    


    
    

