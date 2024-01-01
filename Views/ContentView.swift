//
//  ContentView.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    var weeklyWeatherManager = WeeklyWeatherManager()
    @State var weather: ResponseBody?
    @State var weeklyWeather: WeeklyResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather, weeklyWeather: weeklyWeather!)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weeklyWeather = try await weeklyWeatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                            } catch {
                                print("날씨를 불러오는데 실패! : \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    StartUpView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.675, saturation: 0.799, brightness: 0.368))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
