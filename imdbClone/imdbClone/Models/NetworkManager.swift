//
//  NetworkManager.swift
//  imdbClone
//
//  Created by Vaibhav Bisht on 09/09/20.
//  Copyright © 2020 Vaibhav Bisht. All rights reserved.
//

import Foundation
import UIKit

protocol  NetworkManagerDelegate {
    func didUpdateData(_ networkManager : NetworkManager,  product : ProductDto)
    func didfail(error : Error)
}

struct NetworkManager {
    
    var delegate : NetworkManagerDelegate?
    let apiURL = "http://www.omdbapi.com/?s=Batman&page=1&apikey=eeefc96f"
    
      
    
    
    func performApiReq(urlString: String){
        
      if  let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
        let task =  session.dataTask(with: url) { (data, response, error) in
            if error != nil{
                self.delegate?.didfail(error: error!)
                return
            }
            else {
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString ?? "no Value returened")
//                    if  let movie = self.parseJson(safeData){
//                        self.delegate?.didUpdateData(self, product: movie)
//                    }
                }
            }
        }
        task.resume()
        }
    }

func parseJson(){
    
}
}
