//
//  EditarMedicamentoViewController.swift
//  AppTables
//
//  Created by Sadohu on 11/10/23.
//

import UIKit

class EditarMedicamentoViewController: UIViewController {
    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDescripcion: UITextView!
    @IBOutlet weak var txtStock: UITextField!
    @IBOutlet weak var txtPrecio: UITextField!
    @IBOutlet weak var txtFecha: UITextField!
    public var medicamento : Medicamento!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    @IBAction func btnEditar(_ sender: UIButton) {
        
    }
    
}
