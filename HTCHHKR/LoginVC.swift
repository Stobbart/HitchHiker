//
//  LoginVC.swift
//  HTCHHKR
//
//  Created by Adam Rikardsen-Smith on 10/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginVC: UIViewController{
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var authBtn: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @IBAction func authBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil{
            // animate
            self.view.endEditing(true)
            
            if let email = emailField.text, let password = passwordField.text{
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    if error == nil{
                        if let user = user{
                            if self.segmentedControl.selectedSegmentIndex == 0{
                                let userData = ["provider": user.user.providerID] as [String: Any]
                                DataService.instance().createFirebaseDBUser(uid: user.user.uid, userData: userData, isDriver: false)
                            } else{
                                let userData = ["provider": user.user.providerID, "userIsDriver" : true, "isPickUpModeEnabled" : false, "driverIsOnTrip" : false] as [String: Any]
                                DataService.instance().createFirebaseDBUser(uid: user.user.uid, userData: userData, isDriver: true)
                                
                            }
                        }
                    }
                })
            }
        }
    }
    
    @IBAction func cancelBtnWasPressed(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleScreenTap(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
}

extension LoginVC: UITextFieldDelegate{
    
    
}
