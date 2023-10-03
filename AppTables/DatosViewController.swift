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
    var bean : Cliente!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
}
