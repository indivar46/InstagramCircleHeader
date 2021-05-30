//
//  ItemCell.swift
//  InstaHeader
//
//  Created by Indivar on 29/05/21.
//  Copyright © 2021 Indivar. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var imgVw: UIImageView!
    
    var photoModal : ModelImage!{
        didSet
        {
            
            imgVw.image = UIImage(named: photoModal.strImage)
            if photoModal.isSelected == true
            {
                imgVw.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

            }
            
            else
            {
                let gradient = CAGradientLayer()
                gradient.setGradient(imgVw: imgVw)

            }
            
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        // Initialization code
    

}
}


