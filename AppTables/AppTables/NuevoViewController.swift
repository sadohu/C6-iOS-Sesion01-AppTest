//
//  NuevoViewController.swift
//  AppTables
//
//  Created by Sadohu on 4/10/23.
//

import UIKit

class NuevoViewController: UIViewController {
    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var txtSueldo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnGrabar(_ sender: UIButton) {
        var codigo, edad : Int;
        var nombre, apellido : String;
        var sueldo : Double;
        codigo = Int(txtCodigo.text ?? "0") ?? 0;
        edad = Int(txtEdad.text ?? "0") ?? 0;
        nombre = txtNombre.text ?? "";
        apellido = txtApellido.text ?? "";
        sueldo = Double(txtSueldo.text ?? "") ?? 0;
        // Crear varible de la estructura Cliente
        let data = Cliente(codigo: codigo, nombre: nombre, apellido: apellido, edad: edad, sueldo: sueldo, foto: "");
        // Invocar al método registrarCliente
        ClienteController().addCliente(bean: data);
        print("sucess!");
    }
    
}
