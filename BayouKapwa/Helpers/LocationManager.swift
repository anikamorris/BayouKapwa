//
//  LocationManager.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import UIKit
import MapKit
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    
    @Published var invalid: Bool = false
    lazy var geocoder = CLGeocoder()

    func openMapWithAddress(_ locationString: String) {
        geocoder.geocodeAddressString(locationString) { placemarks, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.invalid = true
                }
                print(error.localizedDescription)
            }
            guard
                let placemark = placemarks?.first,
                let lat = placemark.location?.coordinate.latitude,
                let lon = placemark.location?.coordinate.longitude
            else { return }
            let coords = CLLocationCoordinate2DMake(lat, lon)
            let place = MKPlacemark(coordinate: coords)
            let mapItem = MKMapItem(placemark: place)
            mapItem.name = locationString
            mapItem.openInMaps(launchOptions: nil)
        }
    }

}
