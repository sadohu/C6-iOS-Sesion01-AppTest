//
//  ViewController.swift
//  AppTables
//
//  Created by Sadohu on 27/09/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Arreglo de estructura
    var listaClientes: [Cliente] = []
    // Elemento table
    @IBOutlet weak var tvClientes: UITableView!
    // Capturar el indexPath de la tabla
    var indexCliente = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Indicar a la tabla que trabaja con origen de datos
        tvClientes.dataSource = self;
        // Añadir el protocolo a la tabla
        tvClientes.delegate = self;
        // Llamar al metodo para llenar los datos
        llenarClientes();
        tvClientes.rowHeight = 150;
    }

    @IBAction func btnNuevo(_ sender: UIButton) {
        
    }
    
    // Método
    func llenarClientes(){
        listaClientes.append(Cliente(codigo: 1, nombre: "Juan", apellido: "Gonzales", edad: 20, sueldo: 1200, foto: "persona1"));
        listaClientes.append(Cliente(codigo: 1, nombre: "Ernesto", apellido: "Santiago", edad: 30, sueldo: 1800, foto: "persona2"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaClientes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Acceder al identificador de la celda
        let vista = tvClientes.dequeueReusableCell(withIdentifier: "celda") as! ItemTableViewCell;
        // Acceder a los atributos
        vista.lblCodigo.text = String( listaClientes[indexPath.row].codigo);
        vista.lblNombres.text = listaClientes[indexPath.row].nombre;
        vista.imgFoto.image = UIImage(named: listaClientes[indexPath.row].foto);
        return vista;
    }
    
    // Funcion para seleccionar la celda o fila de la tabla
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Asignar el index de la tabla
        indexCliente = indexPath.row;
        // Identificador de la arrow entre vistas
        performSegue(withIdentifier: "datos", sender: self);
    }
    
    // Metodo para enviar datos a otra pantalla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Crear objeto de la clase DatosViewController
        let destino = segue.destination as! DatosViewController;
        destino.bean = listaClientes[indexCliente];
    }
}

