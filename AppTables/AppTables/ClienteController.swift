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
        // Indicar tabla
        let table = ClienteEntity(context: context);
        // Asignar valores a los atributos del objeto "tabla" con los atributos del parametro bean
        table.codigo = Int16(bean.codigo);
        table.nombre = bean.nombre;
        table.apellido = bean.apellido;
        table.edad = Int16(bean.edad);
        table.sueldo = bean.sueldo;
        // Grabar
        do{
            try context.save();
        } catch(let error as NSError){
            print(error.localizedDescription);
        }
    }
    
    // Listar Cliente
    func listCliente(){
        
    }
}
