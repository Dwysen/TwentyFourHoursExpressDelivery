//
//  MapViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/17.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    
    //  待解决： MkmapView无法释放
    
    private lazy var mapView:MKMapView = {
    
        let mapView = MKMapView(frame: self.view.bounds)
        mapView.mapType = .standard
        mapView.delegate = self
        return mapView
    
    }()

    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(mapView)
    }
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
 
        
        let center = CLLocationCoordinate2D(latitude: 32.029171, longitude: 118.788231)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(currentRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 32.029171, longitude: 118.788231)
        annotation.title = "南京夫子庙"
        annotation.subtitle = "南京市中华路"
        mapView.addAnnotation(annotation)

    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        mapView.removeFromSuperview()
        view.addSubview(mapView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        mapView.delegate = nil
        mapView.removeFromSuperview()
    
        
    }
    
    deinit {
        print("MapView relese")
    }

}
