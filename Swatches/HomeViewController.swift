//
//  ViewController.swift
//  Swatches
//
//  Created by Brigitta Audrey on 22/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var categoryToSend:String?
    
    let categoryNames = [
        "Relaxing",
        "Adventurous",
        "Vintage",
        "Playful",
        "Nature",
        "Modern",
        "Fresh",
        "Elegant"
    ]
    
    let categoryImages = [
        UIImage(named: "Relaxing"),
        UIImage(named: "Adventurous"),
        UIImage(named: "Vintage"),
        UIImage(named: "Playful"),
        UIImage(named: "Nature"),
        UIImage(named: "Modern"),
        UIImage(named: "Fresh"),
        UIImage(named: "Elegant")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SwatchCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
    
        if UserDefaults.standard.bool(forKey: "IS_FIRST_TIME") == true {
            loadToCoreData()
        }
        
    }
    
    func loadToCoreData() {
        
        print("\n\n\n CORE DATA CALLED \n\n")
        
        let context = appDelegate.persistentContainer.viewContext
        let arr = ColorSeeder.colorArray
        
        for color in arr {
            do{
                var colors = Colors(context: context)
                colors.colorName = color.colorName
                colors.category = color.colorTag
                colors.hexValue = color.hexValue
                colors.red = color.red
                colors.green = color.green
                colors.blue = color.blue
                
                context.insert(colors)
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        UserDefaults.standard.set(false, forKey: "IS_FIRST_TIME")
    }


}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! SwatchCategoryCollectionViewCell
        cell.categoryLabel.text = categoryNames[indexPath.row]
        cell.categoryImage.image = categoryImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        categoryToSend = categoryNames[indexPath.row]
        performSegue(withIdentifier: "toBaseColorSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBaseColorSegue" {
            let dest = segue.destination as! BaseColorViewController
            dest.sentCategory = categoryToSend
        }
    }
    
}

