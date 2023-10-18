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
        txtCodigo.text = String(medicamento.codigo);
        txtNombre.text = medicamento.nombre;
        txtDescripcion.text = medicamento.descripcion;
        txtStock.text = String(medicamento.stock);
        txtPrecio.text = String(medicamento.precio);
        txtFecha.text = medicamento.fecha;
    }

    @IBAction func btnEditar(_ sender: UIButton) {
        var codigo, stock : Int;
        var nombre, descripcion, fecha : String;
        var precio : Double;
        codigo = Int(txtCodigo.text ?? "0") ?? 0;
        nombre = txtNombre.text ?? "";
        descripcion = txtDescripcion.text ?? "";
        stock = Int(txtStock.text ?? "0") ?? 0;
        precio = Double(txtPrecio.text ?? "0") ?? 0;
        fecha = txtFecha.text ?? "";
        
        let medicamento = Medicamento(codigo: codigo, nombre: nombre, descripcion: descripcion, stock: stock, precio: precio, fecha: fecha);
        
        updateMedicamento(bean: medicamento);
    }
    
    func updateMedicamento(bean : Medicamento){
        do{
            // Convertir a Json el valor del parametro bean
            let jsonData = try JSONEncoder().encode(bean);
            let URLAPI = "https://puedeser.onrender.com/medicamento/actualizar";
            let urlForSave = URL(string: URLAPI);
            var request = URLRequest(url: urlForSave!);
            
            // Especificar parámetros
            request.httpMethod = "PUT";
            // Envío de data tipo Json
            request.setValue("application/json", forHTTPHeaderField: "Content-Type");
            // Respuesta de data tipo Json
            request.setValue("application/json", forHTTPHeaderField: "Accept");
            
            // Enviar finalmente el objeto
            request.httpBody = jsonData;
            
            // Crear tarea
            let task = URLSession.shared.dataTask(with: request){data, reponse, error in
                do{
                    if(error == nil){
                        let data = try JSONDecoder().decode(Medicamento.self, from: data!);
                        DispatchQueue.main.async {
                            print(data);
                        }
                    }
                } catch {
                    print(error.localizedDescription);
                }
            }
            task.resume();
        } catch{
            print("Holi");
        }
    }
    
}
