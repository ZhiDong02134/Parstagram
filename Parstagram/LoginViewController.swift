//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Danny Dong on 3/10/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user !== nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                return
            }
            
            print("Error: \(error?.localizedDescription ?? "error oh no!")")
         }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text

        user.signUpInBackground {
            (success, error) in
            if (success) {
                return self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            
            print("Error: \(error?.localizedDescription ?? "error oh no!")")
        }
        // other fields can be set just like with PFObject
//        user["phone"] = "415-392-0202"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}