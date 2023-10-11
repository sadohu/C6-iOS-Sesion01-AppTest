//
//  LibroViewController.swift
//  AppTables
//
//  Created by Sadohu on 6/10/23.
//

import UIKit

class LibroViewController: UIViewController , UICollectionViewDataSource{
    
    var libroList : [Libro] = [];
    
    @IBOutlet weak var cvLibros: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func fillDataLibroList(){
        libroList.append(Libro(codigo: 1, titulo: "Libro 1", precio: 25.6, cantidad: 30, foto: "harry1"));
        libroList.append(Libro(codigo: 1, titulo: "Libro 2", precio: 15.6, cantidad: 10, foto: "harry2"));
        libroList.append(Libro(codigo: 1, titulo: "Libro 3", precio: 35.6, cantidad: 20, foto: "harry3"));
        libroList.append(Libro(codigo: 1, titulo: "Libro 4", precio: 25.6, cantidad: 40, foto: "harry4"));
        libroList.append(Libro(codigo: 1, titulo: "Libro 5", precio: 15.6, cantidad: 10, foto: "harry5"));
        libroList.append(Libro(codigo: 1, titulo: "Libro 6", precio: 35.6, cantidad: 20, foto: "harry6"));
        libroList.append(Libro(codigo: 1, titulo: "Libro 7", precio: 25.6, cantidad: 30, foto: "harry7"));
    }
}
