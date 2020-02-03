//
//  SignInVC.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 2/1/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signIn()
    {
        /// TODO:  do the sign in api call here
        fakeSignIn(username: emailField.text!, password: passwordField.text!)
    }
    
    
    func fakeSignIn(username: String, password: String)
    {
        switch (username, password) {
        /// **Admin**
        case ("omsi96", "1234"):
            performSegue(withIdentifier: "admin", sender: nil)
        case ("omar", "1234"):
            performSegue(withIdentifier: "signedIn", sender: nil)
        case ("abdullah", "1234"):
            performSegue(withIdentifier: "signedIn", sender: nil)
        default:
            print("Wrong username and password")
        }
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
