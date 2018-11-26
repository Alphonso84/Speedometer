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

class SpeedView: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var speedLabel: UILabel!
    var manager = CLLocationManager()
    var last:CLLocation?
     
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    func processLocation(_ current:CLLocation) {
        guard last != nil else {
            last = current
            return
        }
        var speed = current.speed
        if (speed > 0) {
            print(speed)
            speedLabel.text = "\(speed)"
            // or whatever
        } else {
            speed = last!.distance(from: current) / (current.timestamp.timeIntervalSince(last!.timestamp))
            speedLabel.text = "\(speed)"
            print(speed)
            
        }
        last = current
    }
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            processLocation(location)
        }
    }
    
    
    
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
    
    
    func updateSpeed() {
        while 1 > 0 {
            
        }
    }
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        manager.startUpdatingHeading()
        backgroundImage.image = #imageLiteral(resourceName: "Background")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        speedLabel.text = "\(last?.speed)"
    }
    
    
}

