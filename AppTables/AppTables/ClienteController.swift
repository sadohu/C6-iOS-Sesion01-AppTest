//
//  ClienteController.swift
//  AppTables
//
//  Created by Sadohu on 4/10/23.
//

import UIKit

class ClienteController: NSObject {
    // Registrar Cliente
    func addCliente(bean : Cliente){
        // nuevo objeto de clase AppDelegate (donde se encuentra la conexion)
        let delegate = UIApplication.shared.delegate as! AppDelegate;
        // Acceder a la base de datos
        let context = delegate.persistentContainer.viewContext;
        
    }
    
    // Listar Cliente
    func listCliente(){
        
    }
}
