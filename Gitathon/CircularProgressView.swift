//
//  CircularProgressView.swift
//  Quiz app
//
//  Created by sanjithsethu on 15/6/21.
//

import SwiftUI

struct CircularProgressView: View {
    
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.red)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: .init(lineWidth: 20.0,
                                     lineCap: .round,
                                     lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
        }
        .padding()
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.25)
    }
}