//
//  BaseColorViewController.swift
//  Swatches
//
//  Created by Brigitta Audrey on 26/07/22.
//

import UIKit

class BaseColorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sentCategory:String?
    var colorCollection = [Colors]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BaseColorTableViewCell", bundle: nil), forCellReuseIdentifier: "baseColorCell")

        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = Colors.fetchBasedOnCategory(category: sentCategory!)
        let result = try! context.fetch(fetchRequest)
        colorCollection = result
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = sentCategory
    }

}

extension BaseColorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colorCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "baseColorCell") as! BaseColorTableViewCell
        
        cell.colorName.text = colorCollection[indexPath.section].colorName
        cell.hexValue.text = colorCollection[indexPath.section].hexValue
        
        let red = colorCollection[indexPath.section].red / 255.0
        let green = colorCollection[indexPath.section].green / 255.0
        let blue = colorCollection[indexPath.section].blue / 255.0
        
        cell.colorBox.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
        return cell
    }
    
    
    
}
