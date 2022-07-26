//
//  BaseColorViewController.swift
//  Swatches
//
//  Created by Brigitta Audrey on 26/07/22.
//

import UIKit

class BaseColorViewController: UIViewController {
    
    var sentCategory:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Load from core data based on category
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = sentCategory
    }

}
