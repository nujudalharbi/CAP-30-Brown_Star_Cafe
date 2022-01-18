//
//  cratTableViewCell.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 26/05/1443 AH.
//

import UIKit

class StatusOrderTableViewCell: UITableViewCell {
//--------------------------------------
    @IBOutlet weak var closedLbl: UILabel!
    @IBOutlet weak var backgroundCell: UIImageView!
  
    @IBOutlet weak var viewCellCloseOrd: UILabel!
    
    @IBOutlet weak var orderLbl: UILabel!
//    -------------------------
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
