//
//  NewUserViewController.swift
//  AppTables
//
//  Created by Sadohu on 18/10/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class NewUserViewController: UIViewController {
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
        let name = txtNombre.text ?? "";
        let lastName = txtApellido.text ?? "";
        let age = Int(txtEdad.text ?? "0") ?? 0;
        let userName = txtUsuario.text ?? "";
        let password = txtContrasena.text ?? "";
        
        addAuthenticacion(name: name, lastName: lastName, age: age, userName: userName, password: password);
        
    }
    
    func addAuthenticacion(name : String, lastName : String, age : Int, userName : String, password : String){
        // Grabar autenticacion
        Auth.auth().createUser(withEmail: userName, password: password){result, error in
            if let dataAuth = result{
                // Capturar UID de la Autenticacion
                let uid = dataAuth.user.uid;
                self.addUser(name: name, lastName: lastName, age: age, uid: uid);
            }else{
                self.alertView(message: "Error en el registro de credenciales.")
            }
        }
    }
    
    func addUser(name : String, lastName : String, age : Int, uid : String){
        /* Grabar usuario en Firestore */
        // Obtener acceso a la base de datos
        let database = Firestore.firestore();
        // Acceder a la coleccion usuarios
        database.collection("usuarios").document(uid).setData([
            "nombre": name,
            "apellido": lastName,
            "edad": age
        ]){error in
            // Validar posibles errores
            if let existError = error{
                self.alertView(message: "Existe error en registro de usuario y credenciales.");
            }else{
                self.alertView(message: "Registro de usuario y credenciales correctas.");
            }
        }
    }
    
    func alertView(message : String){
        let alert = UIAlertController(title: "Sistema", message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default));
        present(alert, animated: true);
    }
}
