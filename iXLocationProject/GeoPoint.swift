//
//  GeoPoint.swift
//  iXLocationProject
//
//  Created by Ryann Consalo on 2017/06/06.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import Foundation
import Gloss


class GeoPoint {
    
    var lat : Double!
    var long : Double!
    
    init(latitude lat: Double, longitutde long: Double!) {
        self.lat = lat
        self.long = long
    }
    
    init() {
        self.lat = 0.0
        self.long = 0.0
    }
    
    required init?(json: JSON) {
        self.lat = "lat" <~~ json
        self.long = "lng" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "lat" ~~> self.lat,
            "lng" ~~> self.long
            ])
    }
}
