//
//  QuizView.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-27.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import SwiftUI
import UIKit

struct QuizView: View {
    @ObservedObject var quizViewModel: QuizViewModel
    let answerTypes: [AnswerType] = AnswerType.AllCases()
    @State var selectedAnswerType: AnswerType?
    @State var showQuestion: Bool = true

    init(quizViewModel: QuizViewModel) {
        print("hello!")
        self.quizViewModel = quizViewModel
    }

    var body: some View {
        ZStack(alignment: .center) {
            Color(#colorLiteral(red: 0.3764297962, green: 0.4000405669, blue: 0.8155850768, alpha: 1)).edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Question \(quizViewModel.currentQuestionIndex + 1) / \(quizViewModel.quiz.count)")
                        .foregroundColor(Color.white)
                        .padding(.top, 70)
                    ZStack {
                        ZStack(alignment: .leading) {
                            Capsule()
                                .frame(width: (UIScreen.main.bounds.width - 50), height: 10)
                                .foregroundColor(Color(#colorLiteral(red: 0.4901465774, green: 0.5098451972, blue: 0.8469544649, alpha: 1)))
                            HStack {
                                Capsule()
                                    .frame(width: CGFloat(abs(Double(quizViewModel.currentQuestionIndex + 1) / 50.0 * Double(UIScreen.main.bounds.width - 50))),
                                           height: 10)
                                    .foregroundColor(Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 1)))
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    NavigationLink(destination:
                    ResultView(resultViewModel: ResultViewModel(quizViewModelDelegate: self.quizViewModel)), isActive: self.$quizViewModel.quizCompleted) {
                        Text("")
                    }
                    .isDetailLink(false)
                    ZStack(alignment: .top) {
                        Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                        VStack(spacing: 20) {
                            QuestionTitleView(question: self.quizViewModel.getCurrentQuestion().question)
                                .frame(width: UIScreen.main.bounds.width - 130, height: 110)
                                .padding(.top, 20)
                            ForEach(AnswerType.allCases, id: \.self) { answer in
                                ResponseButtonView(selectedAnswerType: self.$selectedAnswerType,
                                                   text: answer.stringRepresentation,
                                                   answerType: answer,
                                                   showQuestion: self.$showQuestion,
                                                   quizViewModel: self.quizViewModel)
                            }
                        }
                        VStack {
                            Spacer()
                                .frame(height: 490)
                            HStack {
                                Spacer()
                                    .frame(width: UIScreen.main.bounds.width - 150)
                                NextButtonView(selectedAnswerType: self.$selectedAnswerType, quizViewModel: self.quizViewModel)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 550)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 25)
                    )
                        .padding(.bottom, 80)
                }
            }
            VStack {
                HStack {
                    ExitButton(quizViewModel: self.quizViewModel)
                    Spacer()
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                }
                Spacer()
                .frame(height: UIScreen.main.bounds.height / 1.16)

            }
//            .edgesIgnoringSafeArea(.top)
//            .padding(.top, 20)
//            .edgesIgnoringSafeArea(.top)
//            VStack {
//                HStack {
//                    ExitButton(quizViewModel: self.quizViewModel)
//                    Spacer()
//                        .frame(width: UIScreen.main.bounds.width / 1.2)
//                }
//                Spacer()
//                    .frame(height: UIScreen.main.bounds.height / 1.1)
//            }
        }
    .navigationBarBackButtonHidden(true)
//        .frame(maxWidth: .infinity)
    }
}

struct ExitButton: View {
    @ObservedObject var quizViewModel: QuizViewModel

    var body: some View {
        Button(action: {
            print("quit button pressed")
            self.quizViewModel.quitQuiz()
        }, label: {
            ZStack(alignment: .center) {
                HStack {
                    Capsule().frame(width: 100, height: 50)
                        .foregroundColor(Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 1)))
                    Spacer()
                        .frame(width: 30)
                }
                Image(systemName: "xmark").imageScale(.large)
                    .accentColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }.edgesIgnoringSafeArea(.leading)
        })
    }
}

struct QuestionTitleView: View {
    var question: String

    var body: some View {
        Text(question)
            .font(.title)
            .fontWeight(.bold)
            .minimumScaleFactor(0.01)
            .foregroundColor(Color(#colorLiteral(red: 0.1607119143, green: 0.3019848168, blue: 0.4666053057, alpha: 1)))
    }
}

struct NextButtonView: View {
    @Binding var selectedAnswerType: AnswerType?
    @ObservedObject var quizViewModel: QuizViewModel

    var body: some View {
        Button(action: {
            if let selectedAnswer = self.selectedAnswerType {
                self.quizViewModel.submitAnswer(answer: selectedAnswer)
                self.selectedAnswerType = nil
            }
        }, label: {
            Text("Next")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding([.leading, .trailing], 55)
                .padding([.bottom, .top], 25)
        })
            .frame(width: 200, height: 75)
            .background(self.selectedAnswerType != nil ?
                Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 1)) :
                Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))) // Color of the border
            .cornerRadius(7) // Inner corner radius
    }
}

struct ResponseButtonView: View {
    @Binding var selectedAnswerType: AnswerType?
    var text: String
    var answerType: AnswerType
    @Binding var showQuestion: Bool
    @ObservedObject var quizViewModel: QuizViewModel

    var body: some View {
        Button(action: {
            self.selectedAnswerType = self.answerType
        }, label: {
            HStack {
                Text(text)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding()
                Spacer()
            }
            .accentColor(self.selectedAnswerType == answerType ? Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) : Color(#colorLiteral(red: 0.5294117647, green: 0.6392156863, blue: 0.7725490196, alpha: 1)))
            .frame(width: UIScreen.main.bounds.width - 130, height: 45)
            .background(self.selectedAnswerType == answerType ?
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 1)), Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing) :
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)) // Color of the border
                .cornerRadius(7) // Inner corner radius
                .padding(1) // Width of the border
                .background(self.selectedAnswerType == answerType ?
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 1)), Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5294117647, green: 0.6392156863, blue: 0.7725490196, alpha: 1)), Color(#colorLiteral(red: 0.5294117647, green: 0.6392156863, blue: 0.7725490196, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)) // Color of the border
                .cornerRadius(8) // Outer corner radius
        })
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            NavigationView {
                QuizView(
                    quizViewModel: QuizViewModel()
                )
            }
                .edgesIgnoringSafeArea(.top)
                .navigationBarTitle(Text("Quiz")) // Add this line
                .navigationBarHidden(true)
                
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")

            NavigationView {
                QuizView(
                    quizViewModel: QuizViewModel()
                )
            }
                .edgesIgnoringSafeArea(.top)
                .navigationBarTitle(Text("Quiz")) // Add this line
                               .navigationBarHidden(true)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
