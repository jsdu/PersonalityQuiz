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
            ZStack(alignment: .top) {
                Image(uiImage: #imageLiteral(resourceName: "personalityBg"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)

                HStack {
                    VStack(alignment: .leading) {
                        Text(self.resultViewModel.personalityContainer.personalityName)
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                        Text(self.resultViewModel.personalityContainer.personalityModel.name)

                        Text(self.resultViewModel.personalityContainer.personalityModel.description)
                            .multilineTextAlignment(.center)
                            .padding(.top, UIScreen.main.bounds.height/5.2)
                    }
                    .foregroundColor(Color.white)
                    Spacer()
                }
                .padding(.top, 100)
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack {
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height - 20)
                    ZStack {
                        Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                        VStack {
                            Capsule().frame(width: 75, height: 5)
                                .foregroundColor(Color(#colorLiteral(red: 0.1607119143, green: 0.3019848168, blue: 0.4666053057, alpha: 1)))
                                .padding(.top, 20)

                            HStack {
                                Text("Results")
                                    .font(.title)
                                    .foregroundColor(Color(#colorLiteral(red: 0.1607119143, green: 0.3019848168, blue: 0.4666053057, alpha: 1)))
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
                        .padding(.bottom, 10)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25))
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
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Text(text.0)
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    .fontWeight(.medium)
                    .frame(width: 70)
                    .multilineTextAlignment(.trailing)
                ZStack(alignment: .leading) {
                    Capsule().frame(width: UIScreen.main.bounds.width / 2.3, height: 5)
                        .foregroundColor(Color(#colorLiteral(red: 0.9310112596, green: 0.9362261891, blue: 0.9490919709, alpha: 1)))
                    HStack {
                        Capsule().frame(width: CGFloat(value * Double(UIScreen.main.bounds.width) / 2.3), height: 5)
                            .foregroundColor(Color(#colorLiteral(red: 0.3764297962, green: 0.4000405669, blue: 0.8155850768, alpha: 1)))
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
            .edgesIgnoringSafeArea(.top)
                .navigationBarTitle(Text("Quiz")) // Add this line
                .navigationBarHidden(true)

                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")

            NavigationView {
                ResultView(resultViewModel:
                    ResultViewModel(quizViewModelDelegate: QuizViewModel()))
            }
            .edgesIgnoringSafeArea(.top)
                .navigationBarTitle(Text("Quiz")) // Add this line
                .navigationBarHidden(true)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
