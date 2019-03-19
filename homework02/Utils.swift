//
//  Utils.swift
//  homework02
//
//  Created by joseph on 3/12/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import Foundation
import UIKit

// send notification

let toShow = "Title1"
let toSay = "Title2"


func msgBox(viewController: UIViewController ,toShow: String, toSay: String, toTell: String) {
    
    let alert1 = UIAlertController(title: toShow, message: toSay, preferredStyle: .alert)
    let action1 = UIAlertAction(title: toTell, style: UIAlertAction.Style.default, handler: nil)
    
    alert1.addAction(action1)
    
    viewController.present(alert1, animated: true, completion: nil)
    
    
}
