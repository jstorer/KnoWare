//
//  CoreLocationController.swift
//  knowareSwift
//
//  Created by Jeremy Storer on 10/18/16.
//  Copyright © 2016 Jeremy Storer. All rights reserved.
//

import UIKit
import CoreLocation

class CoreLocationController: NSObject, CLLocationManagerDelegate {
    var locationManager:CLLocationManager = CLLocationManager()
    
    override init(){
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangeAuthStatus")
    
        switch status{
        case .notDetermined:
            print("notDetermined")
            break
        
        case .authorized:
            print("authorized")
            self.locationManager.startUpdatingLocation()
            break
        
        case .denied:
            print("denied")
            break
        
        default:
            print("Unhandled auth status")
            self.locationManager.startUpdatingLocation()
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        SurveySingleton.sharedInstance.latitude=location.coordinate.latitude
        SurveySingleton.sharedInstance.longitude = location.coordinate.longitude
    }
}
