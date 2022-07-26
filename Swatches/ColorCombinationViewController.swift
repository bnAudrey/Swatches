//
//  ColorCombinationViewController.swift
//  Swatches
//
//  Created by Brigitta Audrey on 26/07/22.
//

import UIKit

class ColorCombinationViewController: UIViewController {
    
    var sentColor:Colors?
    var colorCollection:[[Int]] = []
    
    var red:Double?
    var green:Double?
    var blue:Double?

    // Color Box
    @IBOutlet weak var baseColorBox: UIView!
    @IBOutlet weak var baseColorHexValue: UILabel!
    @IBOutlet weak var baseColorName: UILabel!
    @IBOutlet weak var baseColorCategory: UILabel!
    
    // Color Palette
    @IBOutlet weak var color1: UIView!
    @IBOutlet weak var color2: UIView!
    @IBOutlet weak var color3: UIView!
    @IBOutlet weak var color4: UIView!
    @IBOutlet weak var color5: UIView!
    
    // Tableview
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        red = sentColor?.red
        green = sentColor?.green
        blue = sentColor?.blue
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ColorCombinationTableViewCell", bundle: nil), forCellReuseIdentifier: "colorCombinationCell")
        
        baseColorBox.backgroundColor = UIColor(displayP3Red: red!/255.0, green: green!/255.0, blue: blue!/255.0, alpha: 1.0)
        baseColorHexValue.text = sentColor?.hexValue
        baseColorName.text = sentColor?.colorName
        baseColorCategory.text = sentColor?.category
        
        fetchAPI()
        // TODO: Load content view
    }
    
    func fetchAPI() -> Void {
        colorCollection.removeAll()
        
        let url = URL(string: "http://colormind.io/api/")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: [
            "input" : [[red,green,blue]],
            "model" : "default"
        ])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let json = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
            let parent = json["result"] as! [[Int]]
            
            DispatchQueue.main.sync {
                self.colorCollection = parent
                self.tableView.reloadData()
                
                self.color1.backgroundColor = UIColor(
                    displayP3Red: CGFloat(self.colorCollection[0][0])/255,
                    green: CGFloat(self.colorCollection[0][1])/255,
                    blue: CGFloat(self.colorCollection[0][2])/255,
                    alpha: 1.0
                )
                
                self.color2.backgroundColor = UIColor(
                    displayP3Red: CGFloat(self.colorCollection[1][0])/255,
                    green: CGFloat(self.colorCollection[1][1])/255,
                    blue: CGFloat(self.colorCollection[1][2])/255,
                    alpha: 1.0
                )
                
                self.color3.backgroundColor = UIColor(
                    displayP3Red: CGFloat(self.colorCollection[2][0])/255,
                    green: CGFloat(self.colorCollection[2][1])/255,
                    blue: CGFloat(self.colorCollection[2][2])/255,
                    alpha: 1.0
                )
                
                self.color4.backgroundColor = UIColor(
                    displayP3Red: CGFloat(self.colorCollection[3][0])/255,
                    green: CGFloat(self.colorCollection[3][1])/255,
                    blue: CGFloat(self.colorCollection[3][2])/255,
                    alpha: 1.0
                )
                
                self.color5.backgroundColor = UIColor(
                    displayP3Red: CGFloat(self.colorCollection[4][0])/255,
                    green: CGFloat(self.colorCollection[4][1])/255,
                    blue: CGFloat(self.colorCollection[4][2])/255,
                    alpha: 1.0
                )
                
            }
            
        }.resume()
    }
    
    @IBAction func reloadAPI(_ sender: Any) {
        fetchAPI()
    }

    @IBAction func share(_ sender: Any) {
        let textConcat = "\(sentColor?.colorName) \(sentColor?.hexValue)"
        
        let shareModal = UIActivityViewController(activityItems: [textConcat], applicationActivities: nil)
        shareModal.popoverPresentationController?.sourceView = self.view
        present(shareModal, animated: true)
    }
    
}

extension ColorCombinationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCombinationCell") as! ColorCombinationTableViewCell
        
        let color = colorCollection[indexPath.section]
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(color[0])/255, green: CGFloat(color[1])/255, blue: CGFloat(color[2])/255, alpha: 1.0)
                
        let hex = "#\(color[0].decToHexString())\(color[1].decToHexString())\(color[2].decToHexString())"
        cell.hexValue.text = hex
    
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colorCollection.count
    }
}
