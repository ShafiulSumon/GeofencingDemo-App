//
//  ViewController.swift
//  GeofencingDemo
//
//  Created by ShafiulAlam-00058 on 4/25/23.
//

import UIKit
import MapKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
		
		NotificationManager.shared.scheduleNotification(title: "Just Checking", body: "You will be notify anytime.")
        
        LocationManager.shared.getUserLocation { [weak self] location in
            guard let self = self else {
                return
            }
            let pin = MKPointAnnotation()
            pin.coordinate = location.coordinate
            
            self.mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
            self.mapView.addAnnotation(pin)
            
            LocationManager.shared.getLocationName(with: location) { [weak self] name in
                self?.title = name
            }
        }
    }
}

