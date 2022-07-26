//
//  ViewController.swift
//  Swatches
//
//  Created by Brigitta Audrey on 22/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SwatchCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
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
    
}

