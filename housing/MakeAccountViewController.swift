//
//  MakeAccountViewController.swift
//  housing
//
//  Created by Cesar Ibarra on 7/15/17.
//  Copyright © 2017 Cesar Ibarra. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class MakeAccountViewController: UIViewController {
    
    @IBOutlet weak var accountUsername: UITextField!
    @IBOutlet weak var accountName: UITextField!
    @IBOutlet weak var accountPassword: UITextField!
    @IBOutlet weak var accountEmail: UITextField!
    @IBOutlet weak var accountPhoneNumber: UITextField!
    
    
    @IBAction func createNewAccount(_ sender: UIButton) {
        guard let username = accountName.text else { return }
        guard let name = accountName.text else { return }
        guard let password = accountPassword.text else { return }
        guard let email = accountEmail.text else { return }
        guard let phoneNumber = accountPhoneNumber.text else { return }
        
        var userDict = [String: String]()
        userDict["username"] = username
        userDict["name"] = name
        userDict["password"] = password
        userDict["email"] = email
        userDict["phoneNumber"] = phoneNumber
        
        Alamofire.request(APIConstants.User.createNewUser, method: .post, parameters: userDict, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                if let json = response.result.value {
                    print(json)
                }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
