//
//  DailyWeatherManager.swift
//  QuickCast
//
//  Created by 이재영 on 2024/01/02.
//

import Foundation
import CoreLocation

class DailyWeatherManager {
    func getDailyWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) async throws -> DailyWeatherModel {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&appid=31d649560fe4ca55d9eea6f64dea15e8&units=metric") else { fatalError("URL을 찾을 수 없습니다.")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("fatching 에러")}
        
        let decodedData = try JSONDecoder().decode(DailyWeatherModel.self, from: data)
        
        return decodedData
    }
}

