//
//  ProductModel.swift
//  imdbClone
//
//  Created by Vaibhav Bisht on 13/09/20.
//  Copyright © 2020 Vaibhav Bisht. All rights reserved.
//

import Foundation

struct ProductModel: Codable {
    let Search : [search]
}

struct search: Codable {
    let Title : String
    let Year : String
    let imdbID :String
    let `Type` : String
    let Poster :String
}
