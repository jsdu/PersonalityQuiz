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
                        .padding(.bottom, 20)
                        .padding(.leading, 20)
                        .padding(.top, 120)

                    }
                    .frame(height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    VStack {
                                        ForEach(CharacterType.allCases, id: \.self) { character in
                                            BarView(value: self.resultViewModel.score[character]!,
                                                    char: character,
                                                text: self.resultViewModel.personalityContainer.personality[character]!)
                                        }
                                    }

                    Button(action: {
                        self.resultViewModel.quizViewModelDelegate?.quitQuiz()
                    }) {
                        Text("Continue")
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BarView: View {

    var value: Int = 0
    var char: CharacterType
    var text: String

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(text)
                    .font(.caption)
                    .frame(width: 70)

                ZStack(alignment: .leading) {
                    Capsule().frame(width: 200, height: 10)
                        .foregroundColor(.yellow)
                    HStack {
                        Capsule().frame(width: CGFloat(abs(value)*2), height: 10)
                            .foregroundColor(.black)
                    }
                }
                .padding(.leading, 10)
                .frame(height: 20)
                Text("\(Int(abs(value)))%")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(width: 40)
            }
        }
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
