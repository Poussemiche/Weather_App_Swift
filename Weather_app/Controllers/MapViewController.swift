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

class MapViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var listView: UITableView!
    
    let city: [City] = CitiesData.list
    
    @IBAction func switchToList(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.isHidden = false
            listView.isHidden = true
        case 1:
            listView.isHidden = false
            mapView.isHidden = true
        default:
            print("Fail")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        listView.delegate = self
        listView.dataSource = self
        
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
        } else {
            if segue.identifier == "ListSegue" {
                if let dest = segue.destination as? DetailsViewController,
                    
                    let choosenCity = listView.indexPathForSelectedRow {
                    let data = MKPointAnnotation()
                    
                    data.coordinate = city[choosenCity.row].coordinates
                    data.title = city[choosenCity.row].name
                    dest.dataReceived = data
                    listView.deselectRow(at: choosenCity, animated: false)
                    }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = listView.dequeueReusableCell(withIdentifier: "ListCitiesCell", for: indexPath) as? ListCitiesCell {
            cell.configure(name: city[indexPath.row].name)
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

