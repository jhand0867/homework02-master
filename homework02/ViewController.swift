//
//  ViewController.swift
//  homework02
//
//  Created by Maria Handschu on 2/18/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var contactList =  [Contact] ()//saves an empty array
    var contactDic =  [Int:Contact] ()//saves an empty array
    var newContact = Contact()//saves contact info from newContactVC
    var selectedRow = 0
    
    @objc func onReceiveNotificaton(notification: Notification) {
        print("\(notification.object)")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print( "viewDidLoad" )
        let cellNib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "mycell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(onReceiveNotificaton(notification:)), name: Notification.Name("ContactRemoved"), object: nil)
        
        
        
        self.contactList = loadData1()
        //print(self.contactList)
        
        //tableView.reloadData()
        
        //self.contactDic = loadData2()
        //print(self.contactDic)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear")
        
        self.contactList = loadData1()
        print(self.contactList)
    }

    private func loadData1() -> [Contact] {
        // loads data from a String response
        // returns array of contacts [Contact]
        print("ladData1")
        var cList = [Contact]()
        
        AF.request("http://ec2-18-234-222-229.compute-1.amazonaws.com/contacts").responseString { response in
            print(response.result.value ?? 0)
            if response.response?.statusCode == 200, response.result.value != nil{
                let resp = (response.result.value!)
                let respArray = resp.components(separatedBy: "\n")
                
                for r in respArray {
                    let contactArray = r.components(separatedBy: ",")
                    //print (contactArray, type(of: contactArray))
                    let nContact = Contact(contactArray[0], contactArray[1],contactArray[2],contactArray[3],contactArray[4])
                    cList.append(nContact)
                }
                
                self.contactList = cList
                print (self.contactList)
                let indexPath = IndexPath(row: cList.count - 1, section: 0)
                
                self.tableView.reloadData()
                
                self.tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle  , animated: true)
            } else
            {
                self.contactList = cList
                self.tableView.reloadData()
                msgBox(viewController: self, toShow: "Connection Error", toSay: "Server Unreachable" , toTell: "Try later")
                
            }
        }
        return cList
    }


    func loadData3() -> [Contact] {
        
        var contacts: [Contact] = []
        
        let contact1 = Contact("", "Joe","my@email.com","123456789","Cell")
        let contact2 = Contact("", "MariPau","my@email.com","123456789","Cell")
        let contact3 = Contact("", "Lore","my@email.com","123456789","Home")
        let contact4 = Contact("", "Matt","my@email.com","123456789","Office")
        let contact5 = Contact("", "Robert","my@email.com","123456789","Home")
        let contact6 = Contact("", "Virginia","my@email.com","123456789","Cell")
        let contact7 = Contact("", "Lucho","my@email.com","123456789","Office")
        
        contacts.append(contact1)
        contacts.append(contact2)
        contacts.append(contact3)
        contacts.append(contact4)
        contacts.append(contact5)
        contacts.append(contact6)
        contacts.append(contact7)
        
        for contact in contacts {
            
            var parameters: Parameters = ["name": contact.name!,
                                          "email": contact.email!,
                                          "phone": contact.phoneNum!,
                                          "type": contact.phoneType!]
            
            AF.request("http://ec2-18-234-222-229.compute-1.amazonaws.com/contact/create", method: .post  , parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseString { (response) in
                
                print(response.result.value!)
            }
        }
        
        return contacts
    }
    

    
    private func loadData2() -> [Int:Contact] {
        // loads data from a String response
        // returns Dictionary of contacts [Int:Contact]
        var cDic = [Int:Contact]()
        
        AF.request("http://ec2-18-234-222-229.compute-1.amazonaws.com/contacts").responseString { response in
            
            let resp = (response.result.value!)
            let respArray = resp.components(separatedBy: "\n")
            
            for r in respArray {
                let contactArray = r.components(separatedBy: ",")
                //print (contactArray, type(of: contactArray))
                let nContact = Contact(contactArray[0], contactArray[1],contactArray[2],contactArray[3],contactArray[4])
                cDic[Int(contactArray[0]) ?? 0] = nContact
            }
            
            //print(respArray, type(of: respArray))
        }
        return cDic
    }

    private func loadData() -> [Contact] {
        
        // loads data frin a JSON response
        let url = URL(string: "https://my-json-server.typicode.com/typicode/demo/posts")!
        
        AF.request(url).responseJSON { response in
            //print(response.value!, type(of: response.value!))
            
            let mutableArray = response.result.value as! NSArray
            
            for item in mutableArray {
                //let  = item[0]
                let d =  item as! NSDictionary
                
                print("\(String(describing: d.value(forKey: "id")))!)")
                print("\(String(describing: d.value(forKey: "name")))")
            }
        }
        return [Contact]()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

  
  
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSeg" {
            
            let dest = segue.destination as! DetailsViewController
            dest.contact = self.newContact
            dest.selectedRow = self.tableView.indexPathForSelectedRow?.row
  //          contactList.remove(at: selectedRow)
        }
    }
    
    
    @IBAction func goBack(unwindSegue: UIStoryboardSegue) {
        //print("unwind segue with identifier \(unwindSegue.identifier) called")
        
        if unwindSegue.identifier == "addContactSegue" {
            contactList.append(newContact)
        }
        
//        if unwindSegue.identifier == "DetailsSeg" {
//            print("detailsseg")
//        }
//        if unwindSegue.identifier == "EditSeg" {
//            print("editseg")
//        }
        
    }
}

extension ViewController: ContactCellDelegate{
    
    
    func deleteClicked(cell: UITableViewCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        //self.contactList.remove(at: (indexPath?.row)!)
        
        
        let contactId = self.contactList[indexPath!.row].id
        
        
        //let url = URL(String: "http://ec2-18-234-222-229.compute-1.amazonaws.com/contact/delete")!

        var parameters: Parameters = ["id":contactId!]
                    
        AF.request("http://ec2-18-234-222-229.compute-1.amazonaws.com/contact/delete",
                   method:.post,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil)
            .responseString { (response) in
                if response.response?.statusCode == 200 {
                    NotificationCenter.default.post(name: NSNotification.Name("ContactRemoved"), object: nil)
                    self.contactList.remove(at: (indexPath?.row)!)
                    //print(" \(indexPath!) deleted")
                    self.tableView.reloadData()
                } else {
                    print ("Error ... \(response.error.debugDescription)" )
                }
        }
        

        
    }
}




extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(self.contactList.count)
        return self.contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("celForAtRow")

        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! ContactCell
        
        let contact = contactList[indexPath.row]
        self.newContact = contact
        
        let name = cell.nameLabel as UILabel
        let email = cell.emailLabel as UILabel
        let phone = cell.phoneLabel as UILabel
        let phoneType = cell.typeLabel as UILabel
        
        name.text = contact.name
        email.text = contact.email
        phone.text = contact.phoneNum
        phoneType.text = String(contact.phoneType!)

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


    


    
    

