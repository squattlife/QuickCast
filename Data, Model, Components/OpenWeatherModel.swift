//
//  OpenWeatherModel.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/25.
//

import Foundation

// 현재 날씨 데이터모델
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
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

// 일일 기상 데이터모델
struct DailyWeatherModel: Decodable {
    struct WeatherData: Codable {
        let cod: String
        let message: Int
        let cnt: Int
        let list: [WeatherInfo]
        let city: CityInfo
    }

    struct WeatherInfo: Codable {
        let dt: Int
        let main: MainInfo
        let weather: [WeatherDetail]
        let clouds: CloudInfo
        let wind: WindInfo
        let visibility: Int
        let pop: Double
        let rain: RainInfo?
        let sys: SysInfo
        let dt_txt: String
    }

    struct MainInfo: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let sea_level: Int
        let grnd_level: Int
        let humidity: Int
        let temp_kf: Double
    }

    struct WeatherDetail: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }

    struct CloudInfo: Codable {
        let all: Int
    }

    struct WindInfo: Codable {
        let speed: Double
        let deg: Int
        let gust: Double
    }

    struct RainInfo: Codable {
        let _3h: Double
    }

    struct SysInfo: Codable {
        let pod: String
    }

    struct CityInfo: Codable {
        let id: Int
        let name: String
        let coord: CoordInfo
        let country: String
        let population: Int
        let timezone: Int
        let sunrise: Int
        let sunset: Int
    }

    struct CoordInfo: Codable {
        let lat: Double
        let lon: Double
    }
}

