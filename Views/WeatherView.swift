//
//  WeatherView.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/26.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        VStack() {
            Text(weather.name)
                .bold().font(.title).padding(.top, 120)
            
            Image(weather.weather.main)
                .resizable()
                .frame(width: 220, height: 200)
            
            Text(weather.main.feels_like.roundDouble() + "°")
                .font(.system(size: 100))
                .fontWeight(.heavy)
                .padding()
            
            Spacer()
            
            HStack(spacing: 60) {
                HStack {
                    Image(systemName: "wind")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(String(weather.wind.speed) + "km")
                        .font(.system(size: 19))
                }
                
                HStack {
                    Image(systemName: "humidity")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(String(weather.main.humidity) + "%")
                        .font(.system(size: 19))
                }
                
                HStack {
                    Text("12")
                    Text("12")
                        .font(.system(size: 19))
                }
            }
                        
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(Color(hue: 0.675, saturation: 0.799, brightness: 0.368))
    }
}
//        ZStack(alignment: .center) {
//            VStack {
//                // 지역,날짜,시간 label
//                VStack(alignment: .center, spacing: 5) {
//                    Text(weather.name)
//                        .bold() .font(.title)
//
//                    Text("Today, \(Date().formatted(.dateTime.month().day()))")
//                        .fontWeight(.light)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//
//                Spacer()
//
//                VStack {
//                    HStack {
//                        VStack(spacing: 20) {
//                            Image(systemName: "sun.max")
//                                .font(.system(size: 40))
//
//                            Text(weather.weather[0].main)
//                        }
//                        .frame(width: 150, alignment: .leading)
//
//                        Spacer()
//
//                        Text(weather.main.feels_like.roundDouble() + "°")
//                            .font(.system(size: 100))
//                            .fontWeight(.heavy)
//                            .padding()
//                    }
//
//                    Spacer()
//
//                }
//                .frame(maxWidth: .infinity)
//            }
//            .padding()
//            .frame(maxWidth: .infinity, alignment: .leading)
//
//            VStack {
//                Spacer()
//
//                VStack(alignment: .leading, spacing: 20) {
//                    Text("현재 날씨")
//                        .fontWeight(.bold).padding(.bottom)
//                        .font(.system(size: 18))
//
//                    HStack {
//                        WeatherRow(logo: "thermometer", name: "최저 온도", value: (weather.main.temp_min.roundDouble() + "°"))
//                        Spacer()
//                        WeatherRow(logo: "thermometer", name: "최고 온도", value: (weather.main.temp_max.roundDouble() + "°"))
//                    }
//
//                    HStack {
//                        WeatherRow(logo: "wind", name: "풍량", value: (weather.wind.speed.roundDouble() + " m/s"))
//                        Spacer()
//                        WeatherRow(logo: "humidity", name: "습도", value: "\(weather.main.humidity.roundDouble())%")
//                    }
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding()
//                .padding(.bottom, 20)
//                .foregroundColor(Color(hue: 0.675, saturation: 0.799, brightness: 0.368))
//                .background(.white)
//                .cornerRadius(20, corners: [.topLeft, .topRight])
//            }
//
//        }
//        .edgesIgnoringSafeArea(.bottom)
//        .background(Color(hue: 0.675, saturation: 0.799, brightness: 0.368))
//        .preferredColorScheme(.dark)
//
//    }
//}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
