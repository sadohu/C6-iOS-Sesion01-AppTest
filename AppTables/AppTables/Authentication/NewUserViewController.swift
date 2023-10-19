//
//  NewUserViewController.swift
//  AppTables
//
//  Created by Sadohu on 18/10/23.
//

import UIKit

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
    }
}
