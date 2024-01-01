//
//  OpenWeatherModel.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/25.
//

import Foundation

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

struct WeeklyResponseBody: Decodable {
    var cod: String
    var message: Int
    var cnt: Int
    var list: [WeatherInfo]
    var city: CityInfo

    struct WeatherInfo: Decodable {
        var dt: TimeInterval
        var main: MainInfo
        var weather: [WeatherDetail]
        var clouds: CloudsInfo
        var wind: WindInfo
        var visibility: Int
        var pop: Double
        var rain: RainInfo?
        var sys: SysInfo
        var dt_txt: String
    }

    struct MainInfo: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var sea_level: Double
        var grnd_level: Double
        var humidity: Double
        var temp_kf: Double
    }

    struct WeatherDetail: Decodable {
        var id: Int
        var main: String
        var description: String
        var icon: String
    }

    struct CloudsInfo: Decodable {
        var all: Int
    }

    struct WindInfo: Decodable {
        var speed: Double
        var deg: Double
        var gust: Double
    }

    struct RainInfo: Decodable {
        var threeHour: Double
    }

    struct SysInfo: Decodable {
        var pod: String
    }

    struct CityInfo: Decodable {
        var id: Int
        var name: String
        var coord: CoordinatesInfo
        var country: String
        var population: Int
        var timezone: Int
        var sunrise: TimeInterval
        var sunset: TimeInterval
    }

    struct CoordinatesInfo: Decodable {
        var lat: Double
        var lon: Double
    }
}
