//
//  MapVC.swift
//  WorldTrotter
//
//  Created by Tiago Henrique on 3/1/17.
//  Copyright © 2017 Tiago Henrique. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController{
    
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        
        topConstraint.isActive = true
        trailingConstraint.isActive = true
        leadingConstraint.isActive = true
        
        segmentedControl.addTarget(self, action: #selector(MapVC.mapTypedChange(_:)), for: .valueChanged)
    }
    
    func mapTypedChange(_ segControl: UISegmentedControl) {
        switch (segControl.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
            break
        case 1:
            mapView.mapType = .hybrid
            break
        case 2:
            mapView.mapType = .satellite
            break
        default:
            break
        }
    }
}
