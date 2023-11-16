//
//  LoginViewController.swift
//  AppTables
//
//  Created by Sadohu on 18/10/23.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let url = URL(string: "https://static.wikia.nocookie.net/heroe/images/f/fe/Pocoyo_opagangan.jpg/revision/latest?cb=20220401131838&path-prefix=es")
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        img.image = UIImage(data: data!)
    
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
            // Validar el Optinal<result>: correcto(Objecto), incorrecto(nulo)
            if let dataAuth = result{
                print("Credenciales correctas.");
                print(dataAuth.user.uid);
            }else{
                print("Credenciales incorrectas.");
            }
        }
    }

    @IBAction func btnFacebookLogin(_ sender: UIButton) {
        let loginManger = LoginManager();
        loginManger.logIn(permissions: ["email"], from: self){
            [weak self] (result, error) in
            guard error == nil else{
                print(error!.localizedDescription);
                return;
            }
            
            guard let result = result, !result.isCancelled else{
                loginManger.logOut();
                print("Usuario canceló proceso.");
                return;
            }
        }
        
        Profile.loadCurrentProfile{ (profile, error) in
            print(Profile.current?.name ?? "");
            print(Profile.current?.lastName ?? "");
            print(Profile.current?.email ?? "");
            // Sent to Home View
        }
    }
}
