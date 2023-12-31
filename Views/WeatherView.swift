//
//  WeatherView.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/26.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var formattedSunrise: String {
        let sunriseTimestamp = TimeInterval(weather.sys.sunrise)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let sunriseDate = Date(timeIntervalSince1970: sunriseTimestamp)
        return dateFormatter.string(from: sunriseDate)
    }
    
    var body: some View {
        ZStack {
            VStack() {
                Text(weather.name)
                    .bold().font(.title).padding(.top, 80)
                
                Image(weather.weather.main)
                    .resizable()
                    .frame(width: 220, height: 200)
                    .padding(.top, 30)
                
                Text(weather.main.feels_like.roundDouble() + "°")
                    .font(.system(size: 100))
                    .fontWeight(.heavy)
                    .padding()
                
                Spacer()
                
                HStack(spacing: 40) {
                    HStack {
                        Image(systemName: "wind")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(2)
                        Text(String(weather.wind.speed.roundDouble()) + "km")
                            .font(.system(size: 19))
                    }
                    
                    HStack {
                        Image(systemName: "humidity")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(2)
                        Text(String(weather.main.humidity.roundDouble()) + "%")
                            .font(.system(size: 19))
                    }
                    
                    
                    
                    HStack {
                        Image(systemName: "sun.haze")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(2)
                        Text("\(formattedSunrise) AM")
                            .font(.system(size: 19))
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.bottom, 240)
            
            // Drag Gesture의 높이를 받기 위해,,
            GeometryReader { proxy in
                let height = proxy.frame(in: .global).height
                
                BlurView(style: .systemThinMaterialDark)
            }
            .ignoresSafeArea(.all, edges: .bottom)

            
        }
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
