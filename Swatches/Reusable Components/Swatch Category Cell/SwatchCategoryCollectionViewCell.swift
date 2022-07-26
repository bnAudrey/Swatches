//
//  SwatchCategoryCollectionViewCell.swift
//  Swatches
//
//  Created by Brigitta Audrey on 22/07/22.
//

import UIKit

class SwatchCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
        // TODO: Create Drop Shadow on collection view cell
        
    }
    
}
