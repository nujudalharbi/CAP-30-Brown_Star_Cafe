//
//  OrderItemTableViewCell.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 16/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase


protocol CellOrder {
    func delete(docID: String)
}


class OrderItemTableViewCell: UITableViewCell{
    var indext: Int = 0
    let db = Database.database().reference()
    var titleStr = ""
    var productObj: products!
    var delegate: CellOrder!
    @IBOutlet weak var titleOrder: UILabel!

    
    @IBOutlet weak var freeOrder: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleOrder.text = titleStr
    }
    
    @IBAction func deletePrssed(_ sender: Any) {
        guard let docID = productObj.id else { return }
        delegate.delete(docID: docID)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

        
    }

