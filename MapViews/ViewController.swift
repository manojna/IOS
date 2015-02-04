//
//  ViewController.swift
//  MapViews
//
//  Created by Paradigm on 10/21/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate{
    let location = CLLocationCoordinate2D(
        latitude: 17.6883,
        longitude: 83.2186)
    let location1 = CLLocationCoordinate2D(
        latitude: 17.3660,
        longitude: 78.4760)

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapType = MKMapType.Hybrid
        
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegion(center: location, span: span)
//        mapView.setRegion(region, animated: true)
//        
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        mapView.addAnnotation(annotation)
        
        let annotation1 = MKPointAnnotation()
        annotation1.setCoordinate(location1)
        mapView.addAnnotation(annotation1)
        
        var coordinates = [location,location1]
        var polyLine = MKPolyline(coordinates: &coordinates, count: 2)
        mapView.addOverlay(polyLine)
        
        mapView.delegate = self


    }
    
  func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
    
    if (overlay is MKPolyline)
    {
        var polylineRender = MKPolylineRenderer(overlay: overlay);
        polylineRender.strokeColor = UIColor.redColor();
        polylineRender.lineWidth = 2;
        return polylineRender;
    }
    return nil
    
    }
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

