//
//  ViewController.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 22/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        for coordinate in CitiesData.list {
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate.coordinates
            pin.title = coordinate.name
            mapView.addAnnotation(pin)
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MKPointAnnotation {
            performSegue(withIdentifier: "DetailsSegue", sender: annotation)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "DetailsSegue" {
            if let dest = segue.destination as? DetailsViewController {
                dest.dataReceived = sender as? MKPointAnnotation
            }
        }
    }


}

