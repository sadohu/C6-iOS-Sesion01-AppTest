//
//  NuevoMedicamentoViewController.swift
//  AppTables
//
//  Created by Sadohu on 11/10/23.
//

import UIKit

class NuevoMedicamentoViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDescripcion: UITextView!
    @IBOutlet weak var txtStock: UITextField!
    @IBOutlet weak var txtPrecio: UITextField!
    @IBOutlet weak var txtFecha: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    func saveMedicamento(bean : Medicamento){
        do{
            // Convertir a Json el valor del parametro bean
            let jsonData = try JSONEncoder().encode(bean);
            let URLAPI = "https://puedeser.onrender.com/medicamento/registrar";
            let urlForSave = URL(string: URLAPI);
            var request = URLRequest(url: urlForSave!);
            
            // Especificar parámetros
            request.httpMethod = "POST";
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
    
    @IBAction func btnGrabar(_ sender: UIButton) {
        var stock : Int;
        var nombre, descripcion, fecha : String;
        var precio : Double;
        nombre = txtNombre.text ?? "";
        descripcion = txtDescripcion.text ?? "";
        stock = Int(txtStock.text ?? "0") ?? 0;
        precio = Double(txtPrecio.text ?? "0") ?? 0;
        fecha = txtFecha.text ?? "";
        
        var medicamento = Medicamento(codigo: 0, nombre: nombre, descripcion: descripcion, stock: stock, precio: precio, fecha: fecha);
        
        saveMedicamento(bean: medicamento);
    }
    
}
