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

enum MapOption {
    case appleMaps
    case googleMaps
}

class LocationManager: NSObject, ObservableObject {
    
    @Published var invalid: Bool = false
    lazy var geocoder = CLGeocoder()

    func openMapWithAddress(_ locationString: String, in mapOption: MapOption) {
        geocoder.geocodeAddressString(locationString) { [weak self] placemarks, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.invalid = true
                }
                print(error.localizedDescription)
            }
            guard
                let placemark = placemarks?.first,
                let lat = placemark.location?.coordinate.latitude,
                let lon = placemark.location?.coordinate.longitude
            else { return }
            switch mapOption {
            case .appleMaps:
                self?.openAppleMapsDirections(lat: lat, lon: lon, location: locationString)
            case .googleMaps:
                self?.openGoogleMapsDirections(lat: lat, lon: lon)
            }
        }
    }

    private func openAppleMapsDirections(
        lat: CLLocationDegrees,
        lon: CLLocationDegrees,
        location: String
    ) {
        let coords = CLLocationCoordinate2DMake(lat, lon)
        let place = MKPlacemark(coordinate: coords)
        let mapItem = MKMapItem(placemark: place)
        mapItem.name = location
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMaps(launchOptions: launchOptions)
    }

    private func openGoogleMapsDirections(
        lat: CLLocationDegrees,
        lon: CLLocationDegrees
    ) {
        let destination = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let url = URL(string: "comgooglemaps://?saddr=&daddr=\(destination.latitude),\(destination.longitude)&directionsmode=driving")!

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Handle the case where Google Maps is not installed (e.g., open in Safari)
            print("Google Maps not installed")
            if let webURL = URL(string: "https://www.google.com/maps/dir/?api=1&destination=\(destination.latitude),\(destination.longitude)&travelmode=driving") {
                UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
            }
        }
    }

}
