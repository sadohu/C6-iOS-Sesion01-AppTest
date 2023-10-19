//
//  LoginViewController.swift
//  AppTables
//
//  Created by Sadohu on 18/10/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let username = txtUser.text ?? "";
        let password = txtPassword.text ?? "";
        loginFirebase(username: username, password: password);
        
    }
    
    func loginFirebase(username : String, password : String){
        // Validacion de credenciales
        Auth.auth().signIn(withEmail: username, password: password){
            result, error in
            print("Aier si es verdad");
        }
    }

}
