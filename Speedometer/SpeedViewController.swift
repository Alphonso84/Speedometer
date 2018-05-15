//
//  SpeedViewController.swift
//  Speedometer
//
//  Created by user on 5/15/18.
//  Copyright © 2018 Alphonso Sensley II. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class SpeedView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data = ["N", "15.5 Miles", "3:22AM"]
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myCell
        
         cell.dataLabel.text = data[indexPath.row]
        cell.dataLabel.textColor = UIColor.white
        cell.dataLabel.font = UIFont.boldSystemFont(ofSize: 70)
        
        return cell
    }
    
    
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        backgroundImage.image = #imageLiteral(resourceName: "Background")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
 
   
    
}
