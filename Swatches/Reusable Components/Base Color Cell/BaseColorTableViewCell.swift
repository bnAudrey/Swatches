//
//  BaseColorTableViewCell.swift
//  Swatches
//
//  Created by Brigitta Audrey on 23/07/22.
//

import UIKit

class BaseColorTableViewCell: UITableViewCell {

    @IBOutlet weak var colorBox: UIView!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var hexValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorBox.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
