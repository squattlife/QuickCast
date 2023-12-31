//
//  WeatherView.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/26.
//

import SwiftUI

struct WeatherView: View {
    
    // 제스처 프로퍼티들
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
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
                    .bold().font(.title).padding(.top, 40)
                
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
            .padding(.bottom, 300)
            .blur(radius: getBlurRadius())
            
            // Drag 제스처 의 높이를 받기 위해,,
            GeometryReader { proxy in
                let height = proxy.frame(in: .global).height
                
                ZStack {
                    BlurView(style: .systemThinMaterialDark)
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 45))
                    
                    VStack {
                        
                        Capsule()
                            .fill(.gray)
                            .frame(width: 70, height: 4)
                            .padding(.top)
                        
                        // Bottom Sheet Contents
                         BottomContent()
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .offset(y: height - 240)
                .offset(y: -offset > 0 ? (-offset <= (height-240) ? offset : (height - 240)) : 0)
                .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
                    out = value.translation.height
                    
                    onChange()
                }).onEnded({ value in
                    
                    let maxHeight = height - 430 // Up 제스처시 Sheet 높이
                    withAnimation {
                        // Sheet 이동에 따른 높이설정 - Up/Down
                        if -offset > maxHeight / 2 {
                            offset = -maxHeight
                        } else {
                            offset = 0
                        }
                    }
                    
                    // 사용자의 Drag 제스처를 통한 sheet높이를 유지하기 위해
                    lastOffset = offset
        
                }))
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .background(Color(hue: 0.675, saturation: 0.799, brightness: 0.368))
    }
    
    func onChange() {
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    // background blur during drag
    func getBlurRadius() -> CGFloat {
        let progress = -offset / (UIScreen.main.bounds.height - 100)
        
        return progress * 20
    }
    
    
}


struct BottomContent: View {
    var body: some View {
        VStack {
            HStack {
                Text("Daily Weather")
                    .bold().foregroundColor(.gray)
                    .padding(.leading, 30)
                Spacer()
            }
            
            Divider()
                .background(.white)
                .padding(.leading).padding(.trailing)
                
            // 주간 날씨
            HStack {
                
            }
            
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
