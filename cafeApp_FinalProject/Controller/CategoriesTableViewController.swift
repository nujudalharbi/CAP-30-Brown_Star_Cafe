//
//  CategoriesTableViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 23/05/1443 AH.
//

import UIKit

struct category {
    var nameCategries : String
    var image : String
}

class CategoriesTableViewController: UITableViewController {
    var categoryArr :  [category ] = [category(nameCategries:  "Hot Drink ", image: "hot") ,
                                      category(nameCategries:  "Cold Drink ", image: "cold" ) , category(nameCategries:  "Sweet ", image: "hot")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName: "CategoriesTableViewCell" , bundle: nil), forCellReuseIdentifier: "categoryID")
      
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
       // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellProduct =
        tableView.dequeueReusableCell(withIdentifier: "categoryID") as! CategoriesTableViewCell
        cellProduct.nameCategory.text = categoryArr[indexPath.row].nameCategries
        cellProduct.imgCategory.image = UIImage(named: categoryArr[indexPath.row].image)
        return cellProduct
    }

}
