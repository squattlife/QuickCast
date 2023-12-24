//
//  LoadingView.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
