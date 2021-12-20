//
//  productItem.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 15/05/1443 AH.
//

import Foundation

class products{
    
    var title : String?
    var descrabition : String?
    var image : String?
    var price : Double?
    init(title : String? = "",  descrabition : String? = "" , image : String? = "", price : Double? = 0.0 ){
        self.title = title
        self.descrabition = descrabition
        self.image = image
        self.price = price
      
    }
    
    
}
