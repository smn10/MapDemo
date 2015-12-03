//
//  MapItem.swift
//  MapDemo
//
//  Created by Sultan Nakyp on 2015-12-02.
//  Copyright © 2015 Sultanio. All rights reserved.
//

import Foundation
import MapKit

class MapItem: NSObject {
    var name: String
    var location: CLLocation
    
    init(name: String, location: CLLocation) {
        self.name = name
        self.location = location
    }
}