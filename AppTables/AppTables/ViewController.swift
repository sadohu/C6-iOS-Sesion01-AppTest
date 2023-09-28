//
//  ViewController.swift
//  AppTables
//
//  Created by Sadohu on 27/09/23.
//

import UIKit

class ViewController: UIViewController {
    // Arreglo de estructura
    var listaClientes: [Cliente] = []

    @IBOutlet weak var tvClientes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnNuevo(_ sender: UIButton) {
        
    }
    
    // Método
    func llenarClientes(){
        listaClientes.append(Cliente(codigo: 1, nombre: "Juan", apellido: "Gonzales", edad: 20, sueldo: 1200, foto: "persona1"));
        listaClientes.append(Cliente(codigo: 1, nombre: "Ana", apellido: "Santiago", edad: 30, sueldo: 1800, foto: "persona2"))
    }
}

