//
//  LocationManager.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    // MARK: 초기화 메서드
    override init() {
        super.init()
        manager.delegate = self
    }
    
    // MARK: 사용자 위치 요청 메서드
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // MARK: Delegate 메서드
    // 위치 받음
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    // 에러 핸들
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("지역을 받는데 에러가 생겼습니다.", error)
        isLoading = false
    }
}
