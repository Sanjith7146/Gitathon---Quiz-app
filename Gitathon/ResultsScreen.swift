//
//  ScoreView.swift
//  Quiz app
//
//  Created by sanjithsethu on 15/6/21.
//

import SwiftUI

struct ResultsScreen: View {
    
    var score: Int
    var totalQuestions: Int
    
    var body: some View {
        ZStack {
            Color(red: 0.871, green: 0.859, blue: 0.824).ignoresSafeArea()
            VStack {
                CircularProgressView(progress: CGFloat(score) / CGFloat(totalQuestions))
                    .frame(width: 180.0, height: 180.0)
                Text("")
                Text("")
                Text("You got \(score)/\(totalQuestions)")
                    .fontWeight(.heavy)
                    .font(.system(size: 30))
                    .padding()
                    .background(Color(red: 0.6901960784313725, green: 0.7686274509803922, blue: 0.6941176470588235))
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.5882352941176471, green: 0.40784313725490196, blue: 0.44313725490196076)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .padding()
            }
        }
    }
}

struct ResultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultsScreen(score: 2, totalQuestions: 3)
    }
}

