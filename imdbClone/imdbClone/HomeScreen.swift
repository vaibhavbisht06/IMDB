//
//  HomeScreen.swift
//  imdbClone
//
//  Created by Vaibhav Bisht on 06/09/20.
//  Copyright © 2020 Vaibhav Bisht. All rights reserved.
//

import UIKit

class HomeScreen : UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [ProductDto]()
    let productCollectionViewCellId = "ProductCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: productCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewCellId)
     
        for _ in 1...17{
            let product = ProductDto()
            product?.Mname = "Vaibhav Bisht"
            product?.Mtype = "Boy"
            product?.Myear = "20"
            products.append(product!)
        }
        collectionView.reloadData()
    }
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset:CGFloat = 20
//        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 15
        let collectionCellSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionCellSize/2, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCollectionViewCellId, for: indexPath) as! ProductCollectionViewCell
        let product = products[indexPath.row]
        cell.Image.image = UIImage(named: "abc")
        cell.Title.text = product.Mname!
        cell.type.text = product.Mtype!
        cell.year.text = product.Myear!
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        print("\(indexPath.row) - \(product.Mname!)")
    }
}
