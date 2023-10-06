//
//  ViewController.swift
//  AppTables
//
//  Created by Sadohu on 27/09/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Arreglo de estructura
    var listaClientes: [ClienteEntity] = []
    // Elemento table
    @IBOutlet weak var tvClientes: UITableView!
    // Capturar el indexPath de la tabla
    var indexCliente = -1;
    
    let refreshControl = UIRefreshControl();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        listaClientes = ClienteController().listCliente();
        // Indicar a la tabla que trabaja con origen de datos
        tvClientes.dataSource = self;
        // Añadir el protocolo a la tabla
        tvClientes.delegate = self;
        // Llamar al metodo para llenar los datos
        // llenarClientes(); --> Se eliminó el metodo y se usa Nueva forma desde CoreData
        tvClientes.rowHeight = 150;
        
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged);
        tvClientes.refreshControl = refreshControl;
    }

    @IBAction func btnNuevo(_ sender: UIButton) {
        // Identificador de la arrow entre vistas "Segue"
        performSegue(withIdentifier: "nuevo", sender: self);
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
//        vista.imgFoto.image = UIImage(named: listaClientes[indexPath.row].foto);
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
        // Validar segue
        if(segue.identifier == "datos"){
            // Crear objeto de la clase DatosViewController
            let destino = segue.destination as! DatosViewController;
            destino.bean = listaClientes[indexCliente];
        }
    }
    
    @objc func updateData() {
      // Aquí obtener los datos actualizados
        listaClientes = ClienteController().listCliente();
      // Recargar la tabla
      self.tvClientes.reloadData()
      // Terminar animación refresh
      self.refreshControl.endRefreshing()
    }
}

