//
//  ContentView.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("당신의 좌표 : \(location.longitude), \(location.latitude)")
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
