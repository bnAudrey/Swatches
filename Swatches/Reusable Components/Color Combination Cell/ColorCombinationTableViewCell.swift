//
//  ColorCombinationTableViewCell.swift
//  Swatches
//
//  Created by Brigitta Audrey on 25/07/22.
//

import UIKit

class ColorCombinationTableViewCell: UITableViewCell {

    @IBOutlet weak var blackBoxCell: UIView!
    @IBOutlet weak var hexValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        blackBoxCell.layer.cornerRadius = 8
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
