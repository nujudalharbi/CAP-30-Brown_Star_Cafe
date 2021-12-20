//
//  menuTableViewCell.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 15/05/1443 AH.
//

import UIKit

class menuTableViewCell: UITableViewCell {

    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var imagesProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
