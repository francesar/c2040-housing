//
//  CreateJobViewController.swift
//  housing
//
//  Created by Julian Martinez on 7/15/17.
//  Copyright © 2017 Cesar Ibarra. All rights reserved.
//

import UIKit

class CreateJobViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var severityPicker: UIPickerView!
    @IBOutlet weak var jobDetailsTextview: UITextView!
    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var jobDescriptionText: UITextView!
    
    let pickerData = ["Low", "Medium", "High"]
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateJobViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        // Connect data:
        self.severityPicker.delegate = self
        self.severityPicker.dataSource = self
        jobDescriptionText.delegate = self
        jobDescriptionText.text = "Please Insert Task Description Here"
        jobDescriptionText.textColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        jobDescriptionText.endEditing(true)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Please Insert Task Description Here"
            textView.textColor = UIColor.lightGray
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(animated){
            super.viewWillAppear(animated)
            let image: UIImage? = Singleton.getImage()
            if image != nil {
                imageThumbnail.image = image
            }
        }
    }
    @IBAction func createNewJob(_ sender: Any) {
        let severityInt = severityPicker.selectedRow(inComponent: 0)
        var severityString = "None"
        if severityInt == 0 {
            severityString = "Low"
        } else if severityInt == 1 {
            severityString = "Medium"
        } else {
            severityString = "High"
        }
        let description: String = jobDescriptionText.text
        
        let picture: UIImage = Singleton.getImage()
        
        let status = "Open"
        
        let date = Date()
        let calendar = Calendar.current
        
        print("THIS IS THE SEVERITY LEVEL:")
        print(severityString)
        print("description: ")
        print(description)
        print("picture:")
        print(picture)
        print("status:")
        print(status)
        print("date:")
        print(date)
        print("calander:")
        print(calendar)
        
        Singleton.setImage(newImage: UIImage())
        
        //TODO use API to get all of the info into the database
        
        //TODO get user_id to also send in with the api call
        
        showToast(message: "New Job Created!")
        
        
        jobDescriptionText.text = "Please Insert Task Description Here"
        jobDescriptionText.textColor = UIColor.lightGray

        imageThumbnail.image = nil
        
        severityPicker.selectRow(0, inComponent: 0, animated: true)
        
        
    }
}

extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } }



