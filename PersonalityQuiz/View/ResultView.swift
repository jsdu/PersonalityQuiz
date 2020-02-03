//
//  ResultView.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-27.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var resultViewModel: ResultViewModel

    var body: some View {
        ZStack(alignment: .top) {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack(alignment: .top) {
                        Image(uiImage: #imageLiteral(resourceName: "personalityBg"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .overlay(
                                LinearGradient(gradient: Gradient(colors: self.resultViewModel.personalityContainer.personalityModel.color), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )

                        HStack {
                            VStack(alignment: .leading) {
                                Text(self.resultViewModel.personalityContainer.personalityName)
                                    .font(.system(size: 50))
                                    .fontWeight(.bold)
                                Text(self.resultViewModel.personalityContainer.personalityModel.name)

                                Spacer()
                                Text(self.resultViewModel.personalityContainer.personalityModel.description)
                            }
                            .foregroundColor(Color.white)
                            Spacer()
                            //                            .frame(width: UIScreen.main.bounds.width)
                        }
                        .padding(.top, 80)
                        .padding()

                    }
                    .frame(height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))

                    HStack {
                        Text("Results")
                            .font(.title)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding()
                    VStack {
                        ForEach(CharacterType.allCases, id: \.self) { character in
                            BarView(color: self.resultViewModel.personalityContainer.personalityModel.color[0],
                                    value: self.resultViewModel.score[character]!,
                                    char: character,
                                    text: self.resultViewModel.getPersonalityLabel(char: character))
                        }
                    }
                    Button(action: {
                        self.resultViewModel.quizViewModelDelegate?.quitQuiz()
                    }, label: {
                        Text("Next")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding([.leading, .trailing], 55)
                            .padding([.bottom, .top], 25)
                    })
                        .frame(width: UIScreen.main.bounds.width - 80, height: 55)
                        .background(Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 1)))
                        .cornerRadius(7) // Inner corner radius
                        .padding(4) // Width of the border
                        .background(Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 0.6015625))) // Color of the border
                        .cornerRadius(10) // Outer corner radius
                        .padding(.top, 50)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BarView: View {
    var color: Color
    var value: Double = 0.0
    var char: CharacterType
    var text: (String, String)

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(text.0)
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    .fontWeight(.medium)
                    .frame(width: 70)
                ZStack(alignment: .leading) {
                    Capsule().frame(width: UIScreen.main.bounds.width / 2.3, height: 5)
                        .foregroundColor(Color(#colorLiteral(red: 0.9310112596, green: 0.9362261891, blue: 0.9490919709, alpha: 1)))
                    HStack {
                        Capsule().frame(width: CGFloat(value * Double(UIScreen.main.bounds.width) / 2.3), height: 5)
                            .foregroundColor(color)
                    }
                }
                .padding(.leading, 10)
                .frame(height: 20)
                Text(text.1)
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    .fontWeight(.medium)
                    .frame(width: 70)
            }
        }
    }
}

struct FinishButtonView: View {

    var body: some View {
        Button(action: {

        }, label: {
            Text("Next")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding([.leading, .trailing], 55)
                .padding([.bottom, .top], 25)
        })
            .frame(width: 200, height: 75)
            .background(Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 1)))
            .cornerRadius(7) // Inner corner radius
            .padding(4) // Width of the border
            .background(Color(#colorLiteral(red: 0.9882168174, green: 0.6588549018, blue: 0.1843422353, alpha: 0.6015625))) // Color of the border
            .cornerRadius(10) // Outer corner radius
    }
}

struct ResultView_Previews: PreviewProvider {
    @State var showQuiz = true
    static var previews: some View {
        Group {
            NavigationView {
                ResultView(resultViewModel:
                    ResultViewModel(quizViewModelDelegate: QuizViewModel()))
            }
                .navigationBarTitle(Text("Quiz")) // Add this line
                .navigationBarHidden(true)

                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")

            NavigationView {
                ResultView(resultViewModel:
                    ResultViewModel(quizViewModelDelegate: QuizViewModel()))
            }
                .navigationBarTitle(Text("Quiz")) // Add this line
                .navigationBarHidden(true)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
