//
//  LibroViewController.swift
//  AppTables
//
//  Created by Sadohu on 6/10/23.
//

import UIKit

class LibroViewController: UIViewController , UICollectionViewDataSource{
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
}
