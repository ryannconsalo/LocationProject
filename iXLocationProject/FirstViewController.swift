//
//  FirstViewController.swift
//  iX_Location
//
//  Created by Ryann Consalo on 2017/06/05.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager: CLLocationManager!
    var currentUserLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager()
        //instantiate LocationManager
        
        locationManager.delegate = self
        //assign delegate to youself
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //Set desired accuracy
        
        locationManager.requestAlwaysAuthorization()
        //request authorization to use location
        
        //locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Get the users location from the array of locations
        // Sorts based on what is most accurate - so get the first
        let userLocation: CLLocation = locations[0] as CLLocation
        
        // You can call stopUpdatingLocation() to stop listening for location updates
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        // Store reference to the users location in the class instance (self)
        // Don't need to use self, but you can
        self.currentUserLocation = userLocation
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        // An error occurred trying to retrieve users location
        print("Error \(error)")
    }
    
    
}

