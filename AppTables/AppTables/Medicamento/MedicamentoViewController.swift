//
//  MedicamentoViewController.swift
//  AppTables
//
//  Created by Sadohu on 11/10/23.
//

import UIKit

class MedicamentoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var medicamentoList : [Medicamento] = [];

    @IBOutlet weak var tvMedicamentos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMedicamentos();
        tvMedicamentos.dataSource = self;
        tvMedicamentos.delegate = self;
        tvMedicamentos.rowHeight = 100;
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
//                    print(medicamentos);
                    DispatchQueue.main.async {
                        self.tvMedicamentos.reloadData();
                    }
                }
            }catch{
                print(error.localizedDescription);
            }
        }
        
        // Inicar tarea
        work.resume();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicamentoList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vista = tvMedicamentos.dequeueReusableCell(withIdentifier: "cellMedicamento") as! MedicamentoTableViewCell;
        vista.lblCodigo.text = "Codigo: " + String( medicamentoList[indexPath.row].codigo);
        vista.lblNombre.text = "Nombre: " + String( medicamentoList[indexPath.row].nombre);
        return vista;
    }
}