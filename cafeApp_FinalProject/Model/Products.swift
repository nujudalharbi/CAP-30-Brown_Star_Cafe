//
//  productItem.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 15/05/1443 AH.
//

import Foundation

class Products{
    
    var title : String?
    var descrabition : String?
    var image : String? = ""
    var price : String? = ""
    var id : String? = ""
    var qunatity : String = ""
    var status : String? = ""
    var tableNum : String? = ""
    var payment : String? = ""

//     -------------------------------
    
    init(title : String? = "",  descrabition : String? = "" , image : String? = "", price :String? = ""
         , id: String = "", qunatity : String = "", status: String? = ""  , tableNum : String? = "" ,  payment : String? = ""
    ){
        self.title = title
        self.descrabition = descrabition
        self.image = image
        self.price = price
        self.id = id
        self.qunatity = qunatity
        self.status = status
        self.tableNum = tableNum
        self.payment = payment
        
    }
//    -------------------------------
    
    func getTitle ()-> String{
        return title!

    }
    
    func getDescrabtion() -> String {
        return descrabition!
        
    }
    func getImage () -> String {
        return image!
        
    }
    func getPrice () -> String {
        return price ?? ""
        
   }
    func getID() -> String{
        return id!

    }
    func getQunatity() -> String{
        return qunatity

    }
    func getStatus() -> String{
        return status!

    }


    func getTableNum() -> String{
        return tableNum!

    }


    func getPayment() -> String{
        return payment!

    }
}
