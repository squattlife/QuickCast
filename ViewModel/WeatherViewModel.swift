//
//  WeatherViewModel.swift
//  QuickCast
//
//  Created by 이재영 on 2024/01/02.
//

import SwiftUI
import CoreLocation

class WeatherViewModel: NSObject, ObservableObject {
    
    @Published var isLoading = true
    @Published var location: CLLocationCoordinate2D?
    @Published var daily: [WeatherDataModel.Daily]?
    
    let apiService = APIService.shared
    let locationManager = CLLocationManager()
    
    // MARK: - Initialization
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        requestLocation()
    }
    
    // MARK: - Class Methods
    func getWeather() {
        if let location = locationManager.location {
            performWeatherRequest(with: location)
        }
    }
    
    func performWeatherRequest(with location: CLLocation) {
        let coordinate = location.coordinate
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&exclude=minutely,alerts&appid=31d649560fe4ca55d9eea6f64dea15e8&units=metric"
        apiService.getJSON(urlString: urlString) { (result: Result<WeatherDataModel, APIService.APIError>) in
            switch result {
            case .success(let result):
                DispatchQueue.main.async { [weak self] in
//                    self?.current = result.current
                    self?.daily = result.daily
                    self?.isLoading = false
                }
            case .failure(let apiError):
                print("mansaError: \(apiError.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
//                    self.appError = AppError(errorString: "\(result)")
                }
            }
        }
    }

}

// MARK: - CLLocationManagerDelegate
extension WeatherViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestLocation()
    }
    
    private func requestLocation() {
        guard CLLocationManager.locationServicesEnabled() else { return }
        
        switch locationAuthorizationStatus() {
        case .notDetermined, .authorizedAlways, .authorizedWhenInUse:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestLocation()
        case .restricted: break
        case .denied: isLoading = false
        @unknown default: break
        }
    }
    
    func locationAuthorizationStatus() -> CLAuthorizationStatus {
        let locationManager = CLLocationManager()
        var locationAuthorizationStatus : CLAuthorizationStatus
        if #available(macCatalyst 14.0, *), #available(iOS 14.0, *) {
            locationAuthorizationStatus =  locationManager.authorizationStatus
        } else {
            // Fallback on earlier versions
            locationAuthorizationStatus = CLLocationManager.authorizationStatus()
        }
        return locationAuthorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        getWeather()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.isLoading = false
        print(error.localizedDescription)
    }
}


