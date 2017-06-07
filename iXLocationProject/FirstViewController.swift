//
//  FirstViewController.swift
//  iX_Location
//
//  Created by Ryann Consalo on 2017/06/05.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate, AddActivityDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager: CLLocationManager!
    var currentUserLocation: CLLocation!
    
    
    override func viewDidLoad() {
    //added comment
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let location = CLLocationCoordinate2D(latitude: -33.918861, longitude: 18.423300)
        //let span = MKCoordinateSpanMake(0.05, 0.05)
        //let region = MKCoordinateRegion(center: location, span: span)
        //map.setRegion(region, animated: true)
        
        //map.showsUserLocation = true
        
        locationManager = CLLocationManager()
        //instantiate LocationManager
        
        locationManager.delegate = self
        //assign delegate to youself
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //Set desired accuracy
        
        locationManager.requestAlwaysAuthorization()
        //request authorization to use location
        
        //locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        setMapType()
    }
    
    override func viewDidAppear(_ _animated: Bool) {
        setMapType()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Get the users location from the array of locations
        // Sorts based on what is most accurate - so get the first
        let userLocation: CLLocation = locations[0] as CLLocation
        
        /*let span : MKCoordinateSpan = MKCoordinateSpanMake(0.05, 0.05)
        let myLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        */
        //self.map.showsUserLocation = true
        
        
        // You can call stopUpdatingLocation() to stop listening for location updates
        // manager.stopUpdatingLocation()
        
        //print("user latitude = \(userLocation.coordinate.latitude)")
        //print("user longitude = \(userLocation.coordinate.longitude)")
        
        // Store reference to the users location in the class instance (self)
        // Don't need to use self, but you can
        self.currentUserLocation = userLocation
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        // An error occurred trying to retrieve users location
        print("Error \(error)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "addActivity" {
            let geopoint = GeoPoint(latitude: currentUserLocation.coordinate.latitude, longitutde: currentUserLocation.coordinate.longitude)
            let activityWithCurrentLocation = Activity()
            activityWithCurrentLocation?.location = geopoint
            
            let navigationController = segue.destination as! UINavigationController
            let addActivityViewController = navigationController.topViewController as! AddActivityViewController
            
            addActivityViewController.newActivity = activityWithCurrentLocation
            addActivityViewController.delegate = self
            
        }
    }
    
    func setMapType() {
        let mapType = UserDefaults.standard.string(forKey: "mapType")
        
        /*if mapType == nil {
            map.mapType = .standard
            UserDefaults.standard.set("standard", forKey: "mapType")
        }
        
        if mapType != nil {
            if mapType == "hybrid" {
                map.mapType = .hybrid
            }
            
            if mapType == "satellite" {
                map.mapType = .satellite
            }
            
            if mapType == "standard" {
                map.mapType = .standard
            }
            
        }
*/
    }
    
    
    func didSaveActivity(activity: Activity) {
        print(activity)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(activity.location.lat, activity.location.long)
        annotation.title = activity.name
        map.addAnnotation(annotation)
    }
    
    func didCancelActivity() {
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        map.centerCoordinate = userLocation.location!.coordinate
    }
    
    
}

