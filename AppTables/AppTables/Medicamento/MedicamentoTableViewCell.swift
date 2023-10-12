//
//  MedicamentoTableViewCell.swift
//  AppTables
//
//  Created by Sadohu on 11/10/23.
//

import UIKit

class MedicamentoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCodigo: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
