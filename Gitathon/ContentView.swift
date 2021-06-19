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
                              option3: "Brocoli",
                              option4: "IPhone",
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
        VStack {
            ProgressView(value: Double(currentQuestion),
                         total: Double(questions.count))
                .padding()
            
            Text(questions[currentQuestion].title)
                .padding()
            
            HStack {
                VStack {
                    Button {
                        didTapOption(optionNumber: 1)
                    } label: {
                        Image(systemName: "triangle.fill")
                        Text(questions[currentQuestion].option1)
                    }
                    Button {
                        didTapOption(optionNumber: 2)
                    } label: {
                        Image(systemName: "circle.fill")
                        Text(questions[currentQuestion].option2)
                    }
                }
                .padding()
                VStack {
                    Button {
                        didTapOption(optionNumber: 3)
                    } label: {
                        Image(systemName: "diamond.fill")
                        Text(questions[currentQuestion].option3)
                    }
                    Button {
                        didTapOption(optionNumber: 4)
                    } label: {
                        Image(systemName: "square.fill")
                        Text(questions[currentQuestion].option4)
                    }
                }
                .padding()
            }
            .padding()
        }
        .alert(isPresented: $isAlertPresented) {
            
            Alert(title: Text(isCorrect ? "Correct" : "Wrong"),
                  message: Text(isCorrect ? "Congrats, you are kinda smart." : "This is outrageous, with such easy questions, how can you be getting this wrong?!"),
                  dismissButton: .default(Text("OK")) {
                    currentQuestion += 1
                    
                    if currentQuestion == questions.count {
                        isModalPresented = true
                        currentQuestion = 0
                    }
                  })
        }.sheet(isPresented: $isModalPresented) {
            ResultsScreen(score: correctAnswers, totalQuestions: questions.count)
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

