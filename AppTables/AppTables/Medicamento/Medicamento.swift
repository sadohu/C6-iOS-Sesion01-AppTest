//
//  Medicamento.swift
//  AppTables
//
//  Created by Sadohu on 11/10/23.
//

import UIKit

struct Medicamento : Codable{
    var codigo : Int;
    var nombre : String;
    var descripcion : String;
    var stock : Int;
    var precio : Double;
    var fecha : String;
}
