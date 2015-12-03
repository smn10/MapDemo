//
//  ViewController.swift
//  MapDemo
//
//  Created by Sultan Nakyp on 2015-12-02.
//  Copyright © 2015 Sultanio. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textField: UITextField!
    var isAnnotationPresent = false
    var newItem: MapItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 49.14, longitude: -122.86)
        let initialRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, 4000.0, 4000.0)
        mapView.setRegion(initialRegion, animated: true)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "handleLongPress:")
        longPressGesture.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(longPressGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleLongPress(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state != .Began {return}
        
        let touchPoint = gestureRecognizer.locationInView(mapView)
        let touchPointCoordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = touchPointCoordinate
        
        if (isAnnotationPresent) {
            mapView.removeAnnotations(mapView.annotations)
        }
        mapView.addAnnotation(annotation)
        isAnnotationPresent = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Done" && isAnnotationPresent {
            if let name = textField.text {
                if !name.isEmpty {
                    let latitude = mapView.annotations.first!.coordinate.latitude
                    let longitude = mapView.annotations.first!.coordinate.longitude
                    newItem = MapItem(name: name, location: CLLocation(latitude: latitude, longitude: longitude))
                }
            }
        }
    }

    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

