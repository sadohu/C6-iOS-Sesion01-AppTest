//
//  DatosViewController.swift
//  AppTables
//
//  Created by Sadohu on 27/09/23.
//

import UIKit

class DatosViewController: UIViewController {
    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var txtSueldo: UITextField!
    @IBOutlet weak var imgFoto: UIImageView!
    // Variable de la estructura Cliente (declarar no nulo "!")
    var bean : ClienteEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Imprimir valores que se encuentra en el objeto
        txtCodigo.text = String(bean.codigo);
        txtNombre.text = bean.nombre;
        txtApellido.text = bean.apellido;
        txtEdad.text = String(bean.edad);
        txtSueldo.text = String(bean.edad);
//        imgFoto.image = UIImage.init(named: bean.foto);
    }
    @IBAction func btnEdit(_ sender: Any) {
        // Actualizar los valores de los atributos del objeto "bean"
        var edad : Int16;
        var nombre, apellido : String;
        var sueldo : Double;
        edad = Int16(txtEdad.text ?? "0") ?? 0;
        nombre = txtNombre.text ?? "";
        apellido = txtApellido.text ?? "";
        sueldo = Double(txtSueldo.text ?? "") ?? 0;
        
        bean.edad = edad;
        bean.nombre = nombre;
        bean.apellido = apellido;
        bean.sueldo = sueldo;
        
        ClienteController().updateCliente(bean: bean);
        print("update success")
    }
    @IBAction func btnDelete(_ sender: Any) {
        
    }
}
