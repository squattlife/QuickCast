//
//  StartUpView.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/25.
//

import SwiftUI
import CoreLocationUI

struct StartUpView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Quick Cast!")
                    .bold()
                    .font(.title)
                
                Text("사용자의 현재 지역의 날씨 정보를 받아올 수 있게 지역 공유 버튼을 눌러주세요!")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct StartUpView_Previews: PreviewProvider {
    static var previews: some View {
        StartUpView()
    }
}
