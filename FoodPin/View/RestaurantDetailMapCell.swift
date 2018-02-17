//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Melinda Swartzfager on 2/11/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(location: String) {
        // Get location
        let geoCoder = CLGeocoder()
        
        print(location)
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                // get first placemark
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
        })
    }

}
