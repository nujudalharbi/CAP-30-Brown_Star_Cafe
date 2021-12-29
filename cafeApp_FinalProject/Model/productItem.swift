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
    var id : String? = ""
    init(title : String? = "",  descrabition : String? = "" , image : String? = "", price : Double? = 0.0, id: String = ""){
        self.title = title
        self.descrabition = descrabition
        self.image = image
        self.price = price
        self.id = id
    }
    
    func getTitle ()-> String{
        return title!

    }
    
    func getDescrabtion() -> String {
        return descrabition!
        
    }
    func getImage () -> String {
        return image!
        
    }
    func getPrice () -> Double {
        return price!
        
    }
    func getID() -> String{
        return id!
        
    }

}
