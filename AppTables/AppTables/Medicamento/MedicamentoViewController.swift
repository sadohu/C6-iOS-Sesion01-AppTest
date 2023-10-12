//
//  MedicamentoViewController.swift
//  AppTables
//
//  Created by Sadohu on 11/10/23.
//

import UIKit

class MedicamentoViewController: UIViewController {
    
    var medicamentoList : [Medicamento] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMedicamentos();
    }

    func loadMedicamentos(){
        let URLAPI = "https://puedeser.onrender.com/medicamento/lista";
        let url = URL(string: URLAPI);
        let work = URLSession.shared.dataTask(with: url!) { data, urlResponse, error in
            do{
                if(error == nil){
                    // [Medicamento] hace referencia a más de un objeto, de ser solo uno indicar solo como: Medicamento
                    let medicamentos = try JSONDecoder().decode([Medicamento].self, from: data!);
                    self.medicamentoList = medicamentos;
                    print(medicamentos);
                }
            }catch{
                print(error.localizedDescription);
            }
        }
        
        // Inicar tarea
        work.resume();
    }
}
