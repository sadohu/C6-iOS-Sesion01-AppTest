//
//  MedicamentoViewController.swift
//  AppTables
//
//  Created by Sadohu on 11/10/23.
//

import UIKit

class MedicamentoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var medicamentoList : [Medicamento] = [];
    var indexMedicamento : Int = -1;

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
        let task = URLSession.shared.dataTask(with: url!) { data, urlResponse, error in
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
        task.resume();
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexMedicamento = indexPath.row;
        performSegue(withIdentifier: "editarMedicamentoView", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editarMedicamentoView"){
            let view = segue.destination as! EditarMedicamentoViewController;
            view.medicamento = medicamentoList[indexMedicamento];
        }
    }
    
    @IBAction func btnNuevo(_ sender: UIButton) {
        performSegue(withIdentifier: "nuevoMedicamentoView", sender: self);
    }
}
