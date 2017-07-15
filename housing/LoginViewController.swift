//
//  ViewController.swift
//  housing
//
//  Created by Cesar Ibarra on 7/15/17.
//  Copyright © 2017 Cesar Ibarra. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginUsername: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    
    @IBAction func login(_ sender: UIButton) {
        //let username = loginUsername.text
        
        if let username = loginUsername.text {
            if let password = loginPassword.text {
                print(username, password)
            }
        }
        
    }
    
}

