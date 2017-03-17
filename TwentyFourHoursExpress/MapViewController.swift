//
//  MapViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/17.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView:MKMapView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        
        mapView = MKMapView(frame: view.bounds)
        mapView.mapType = .standard
        view.addSubview(mapView)
        
    
        let center = CLLocationCoordinate2D(latitude: 32.029171, longitude: 118.788231)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(currentRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 32.029171, longitude: 118.788231)
        annotation.title = "南京夫子庙"
        annotation.subtitle = "南京市中华路"
        mapView.addAnnotation(annotation)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
