//
//  ViewController.swift
//  housing
//
//  Created by Cesar Ibarra on 7/15/17.
//  Copyright © 2017 Cesar Ibarra. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginUsername: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("hello1")
    }
    
    @IBAction func login(_ sender: UIButton) {
        if let username = loginUsername.text {
            if let password = loginPassword.text {
                var userData = [String: String]()
                userData["user_email"] = username
                userData["user_password"] = password
                debugPrint("hello")
                Alamofire.request(APIConstants.User.login, method: .post, parameters: userData, encoding: JSONEncoding.default).responseJSON { r in
                    if let responseJSON = r.result.value {
                        debugPrint(responseJSON)
                    }
                }
            }
        }
    }
}

