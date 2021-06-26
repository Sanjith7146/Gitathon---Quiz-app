//
//  ContentView.swift
//  Quiz app
//
//  Created by sanjithsethu on 15/6/21.
//

import SwiftUI

struct ContentView: View {
    var questions = [Question(title: "What does YJ Eat?",
                              option1: "Nutella",
                              option2: "Rice",
                              option3: "Broccoli",
                              option4: "iPhone",
                              correctOption: 1),
                     Question(title: "What framework are we using?",
                              option1: "UIKit",
                              option2: "SwiftUI",
                              option3: "React Native",
                              option4: "Flutter",
                              correctOption: 2),
                     Question(title: "Which company created Swift?",
                              option1: "Apple",
                              option2: "Orange",
                              option3: "Google",
                              option4: "Tinkercademy",
                              correctOption: 1),
                     Question(title: "What is our Q&A Platform?",
                              option1: "#text-questions",
                              option2: "Yelling in webex",
                              option3: "Ed",
                              option4: "tag Yj and Jia chen",
                              correctOption: 3)]
    
    @State var currentQuestion = 0
    
    @State var correctAnswers = 0
    
    @State var isAlertPresented = false
    @State var isCorrect = false
    
    @State var isModalPresented = false
    
    var body: some View {
        ZStack {
            Color(red: 0.871, green: 0.859, blue: 0.824).ignoresSafeArea()
            VStack {
                withAnimation{
                    ProgressView(value: Double(currentQuestion),
                                 total: Double(questions.count))
                        .padding()
                }
                Text("")
                Text("")
                Text("")
                Text(questions[currentQuestion].title)
                    .fontWeight(.heavy)
                    .font(.system(size: 20))
                    .padding()
                    .background(Color(red: 0.6901960784313725, green: 0.7686274509803922, blue: 0.6941176470588235))
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.5882352941176471, green: 0.40784313725490196, blue: 0.44313725490196076)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .padding()
                
                HStack {
                    VStack {
                        Button {
                            didTapOption(optionNumber: 1)
                        } label: {
                            Image(systemName: "triangle.fill")
                            Text(questions[currentQuestion].option1)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 0.889, green: 0.106, blue: 0.241))
                        .foregroundColor(Color(red: 0.999, green: 0.992, blue: 1.0))
                        .cornerRadius(20)
                        
                        Button {
                            didTapOption(optionNumber: 2)
                        } label: {
                            Image(systemName: "circle.fill")
                            Text(questions[currentQuestion].option2)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 0.844, green: 0.616, blue: 0.013))
                        .foregroundColor(Color(red: 0.999, green: 0.992, blue: 1.0))
                        .cornerRadius(20)
                    }
                    .padding()
                    VStack {
                        Button {
                            didTapOption(optionNumber: 3)
                        } label: {
                            Image(systemName: "diamond.fill")
                            Text(questions[currentQuestion].option3)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 0.226, green: 0.405, blue: 0.806))
                        .foregroundColor(Color(red: 0.999, green: 0.992, blue: 1.0))
                        .cornerRadius(20)
                        
                        Button {
                            didTapOption(optionNumber: 4)
                        } label: {
                            Image(systemName: "square.fill")
                            Text(questions[currentQuestion].option4)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 0.157, green: 0.538, blue: 0.046))
                        .foregroundColor(Color(red: 0.999, green: 0.992, blue: 1.0))
                        .cornerRadius(20)
                    }
                    .padding()
                }
                .padding()
            }
            .alert(isPresented: $isAlertPresented) {
                
                Alert(title: Text(isCorrect ? "Correct" : "Wrong"),
                      message: Text(isCorrect ? "Congrats, you are kinda smart." : "This is outrageous, with such easy questions, how can you be getting this wrong?!"),
                      dismissButton: .default(Text("OK")) {
                        withAnimation{
                            currentQuestion += 1
                            
                            if currentQuestion == questions.count {
                                isModalPresented = true
                                currentQuestion = 0
                            }
                        }
                      })
            }.sheet(isPresented: $isModalPresented) {
                ResultsScreen(score: correctAnswers, totalQuestions: questions.count)
            }
        }
    }
    
    func didTapOption(optionNumber: Int) {
        if optionNumber == questions[currentQuestion].correctOption {
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong!")
            isCorrect = false
        }
        isAlertPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

