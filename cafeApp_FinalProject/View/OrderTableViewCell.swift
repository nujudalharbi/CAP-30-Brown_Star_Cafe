//
//  currentOrdTableViewCell.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 21/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase





class OrderTableViewCell: UITableViewCell {
      
    @IBOutlet weak var backgroundCellOrd: UIImageView!
    var indext: Int = 0
        let db = Database.database().reference()
        var titleStr = ""

    
    
    
    @IBOutlet weak var qauntityLbl: UILabel!
    
    @IBOutlet weak var viewCellOrder: UIView!
    

    @IBOutlet weak var orderImg: UIImageView!
    
    override func awakeFromNib() {
    
        super.awakeFromNib()
        // Initialization code
        titleOrder.text = titleStr
    }
    @IBOutlet weak var titleOrder: UILabel!
   
    
 
    

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
