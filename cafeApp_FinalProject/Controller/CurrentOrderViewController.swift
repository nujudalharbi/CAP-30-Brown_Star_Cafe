//
//  CurrentOrderViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 21/05/1443 AH.
//

import UIKit


class CurrentOrderViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{
    var orderArr = [products]()


  
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
             super.viewDidLoad()
             tabelView.register(UINib(nibName: "currentOrdTableViewCell", bundle: .main), forCellReuseIdentifier: "currentID")

             tabelView.delegate = self
             tabelView.dataSource = self




         }

             // Do any additional setup after loading the view.
        

         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return orderArr.count
         }

         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tabelView.dequeueReusableCell(withIdentifier: "currentID") as! currentOrdTableViewCell
                 cell.currentLbl.text = orderArr[indexPath.row].title

             return cell
         }



     }

