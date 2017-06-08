//
//  Activity.swift
//  iXLocationProject
//
//  Created by Ryann Consalo on 2017/06/06.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import Foundation
import UIKit
import Gloss


class Activity {
    
    var name : String!
    var description: String?
    var location : GeoPoint?
    var image: UIImage?
    
    
    init?(name: String?, description: String?) {
        self.name = name
        self.description = description
        self.image = nil
        self.location = GeoPoint(latitude: 0.0, longitutde: 0.0)
    }
    
    init?() {
        self.name = ""
        self.description = ""
        self.image = nil
        self.location = GeoPoint(latitude: 0.0, longitutde: 0.0)
    }
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.description = "description" <~~ json
        self.location = "location" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "description" ~~> self.description,
            "location" ~~> self.location
            ])
    }
    
}
