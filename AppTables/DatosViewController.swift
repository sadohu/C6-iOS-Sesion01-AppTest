//
//  DatosViewController.swift
//  AppTables
//
//  Created by Sadohu on 27/09/23.
//

import UIKit

class DatosViewController: UIViewController {
    @IBOutlet weak var lblCodigo: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblApellido: UILabel!
    @IBOutlet weak var lblEdad: UILabel!
    @IBOutlet weak var lblSueldo: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    // Variable de la estructura Cliente (declarar no nulo "!")
    var bean : ClienteEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Imprimir valores que se encuentra en el objeto
        lblCodigo.text = "Codigo: " + String(bean.codigo);
        lblNombre.text = "Nombre: " + bean.nombre!;
        lblApellido.text = "Apellido: " + bean.apellido!;
        lblEdad.text = "Edad: " + String(bean.edad);
        lblSueldo.text = "Sueldo: " + String(bean.edad);
//        imgFoto.image = UIImage.init(named: bean.foto);
    }
}
