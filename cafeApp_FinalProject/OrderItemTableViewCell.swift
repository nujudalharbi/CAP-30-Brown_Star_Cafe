//
//  OrderItemTableViewCell.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 16/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase

class OrderItemTableViewCell: UITableViewCell {

    let db = Database.database().reference()
    var titleStr = ""
    @IBOutlet weak var titleOrder: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleOrder.text = titleStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
