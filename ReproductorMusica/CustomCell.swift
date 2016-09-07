//
//  CustomCell.swift
//  ReproductorMusica
//
//  Created by Jesus Manuel Porras on 9/4/16.
//  Copyright © 2016 Jesus Manuel Porras. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var foto: UIView!
    
    @IBOutlet weak var nombre: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
