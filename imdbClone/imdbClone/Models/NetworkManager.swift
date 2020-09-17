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
    func didUpdateData(_ networkManager : NetworkManager,  product : ProductModel)
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
                    if let safeData = data {
                        let dataString = String(data: safeData, encoding: .utf8)
                        if  let movies = self.parseJson(safeData){
                            self.delegate?.didUpdateData(self, product: movies)
                        }
                    }
                
            }
            task.resume()
        }
    }
    
    func parseJson(_ productDto: Data) ->ProductModel{
        let decoder = JSONDecoder()
        do {
            let decodableData = try decoder.decode(ProductDto.self, from: productDto)
        } catch {
            delegate?.didfail(error: error)
        }
    }
}
