//
//  CategoriesTableViewCell.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 23/05/1443 AH.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var nameCategory: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
