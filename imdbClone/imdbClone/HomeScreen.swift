//
//  HomeScreen.swift
//  imdbClone
//
//  Created by Vaibhav Bisht on 06/09/20.
//  Copyright © 2020 Vaibhav Bisht. All rights reserved.
//

import UIKit

class HomeScreen : UIViewController, NetworkManagerDelegate {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let productCollectionViewCellId = "ProductCollectionViewCell"
    var products = [ProductDto]()
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.delegate = self
        contentLoad()
    }
    
    func contentLoad(){
        let apiURL = "http://www.omdbapi.com/?s=Batman&page=1&apikey=eeefc96f"
        networkManager.performApiReq(urlString: apiURL)
        let nibCell = UINib(nibName: productCollectionViewCellId, bundle: nil)
           collectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewCellId)
        
//           for _ in 1...16{
//               let product = ProductDto()
//               product?.Mname = "Vaibhav Bisht"
//               product?.Mtype = "Boy"
//               product?.Myear = "20"
//               products.append(product!)
//           }
           collectionView.reloadData()
    }
    
    func didUpdateData(_ networkManager: NetworkManager, product: ProductDto) {
        print("Data Recived")
        for data in product.Search{
            print(data.Title)
        }
    }
    
    func didfail(error: Error) {
        print("Error")
    }
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let padding: CGFloat = 20
           let collectionViewSize = collectionView.frame.size.width - padding
           return CGSize(width: collectionViewSize/2, height: 300)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          let inset:CGFloat = 15
          return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
      }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCollectionViewCellId, for: indexPath) as! ProductCollectionViewCell
        let product = products[indexPath.row]
        cell.Image.image = UIImage(named: "abc")
//        cell.Title.text = product.Mname!
//        cell.type.text = product.Mtype!
//        cell.year.text = product.Myear!
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
//        print("\(indexPath.row) - \(product.Mname!)")
    }
}
