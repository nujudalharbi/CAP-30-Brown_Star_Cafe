//
//  productTableViewCell.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 22/05/1443 AH.
//

import UIKit

class productTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
