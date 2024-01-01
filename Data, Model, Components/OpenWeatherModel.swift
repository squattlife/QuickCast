//
//  OpenWeatherModel.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/25.
//

import Foundation

struct WeatherDataModel: Codable {
    let timezone_offset: Int
    let current: Current
    let daily: [Daily]
    let hourly: [Hourly]
    
    // MARK: - Current Weather Model
    struct Current: Codable {
        let dt: Int
        let sunrise: Int
        let sunset: Int
        let temp: Double
        let feels_like: Double
        let pressure: Int
        let humidity: Int
        let uvi: Double
        let clouds: Int
        let visibility: Int
        let wind_speed: Double
        let wind_deg: Int
        let weather: [Weather]
    }
    
    // MARK: - Hourly Weather Model
    struct Hourly: Codable {
        let dt: Int
        let temp: Double
        let humidity: Int
        let clouds: Int
        let pop: Double
        let weather: [Weather]
    }
    
    // MARK: - Current Weather Model
    struct Daily: Codable {
        let dt: Int
        let temp: Temp
        let clouds: Int
        let humidity: Int
        let pop: Double
        let weather: [Weather]
        
        struct Temp: Codable {
            let min: Double
            let max: Double
        }
    }
    
    // MARK: - Sub Detail Model
    struct Weather: Codable {
        let description: String
        let icon: String
    }
}


struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: WeatherResponse
    var main: MainResponse
    var name: String
    var wind: WindResponse
    var sys: SysResponse
    
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
    struct SysResponse: Decodable {
        var type: Double
        var id: Double
        var country: String
        var sunrise: Double
        var sunset: Double
    }
}
