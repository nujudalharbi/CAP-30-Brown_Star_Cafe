//
//  menuTableViewCell.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 15/05/1443 AH.
//

import UIKit

class menuTableViewCell: UITableViewCell {
    
    
//------------------ outlet
    
    @IBOutlet weak var backgroundCellImg: UIImageView!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var imagesProduct: UIImageView!
//    -----------------
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
   
        // Configure the view for the selected state
    }
    
}
