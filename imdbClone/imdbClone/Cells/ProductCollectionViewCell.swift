//
//  ProductCollectionViewCell.swift
//  imdbClone
//
//  Created by Vaibhav Bisht on 07/09/20.
//  Copyright © 2020 Vaibhav Bisht. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Title: UILabel!
    
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var type: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
