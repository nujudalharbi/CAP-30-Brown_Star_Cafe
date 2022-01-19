//
//  currentOrdTableViewCell.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 21/05/1443 AH.
//

import UIKit






class OrderTableViewCell: UITableViewCell {
    
    
    var titleStr = ""
//    ------------------------------------
      
    @IBOutlet weak var backgroundCellOrd: UIImageView!
    
    @IBOutlet weak var qauntityLbl: UILabel!
    
    @IBOutlet weak var viewCellOrder: UIView!
    

    
    @IBOutlet weak var titleOrder: UILabel!
   
// ---------------------------------------------
    override func awakeFromNib() {
    
        super.awakeFromNib()
        // Initialization code
        titleOrder.text = titleStr
    }
 
    

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
