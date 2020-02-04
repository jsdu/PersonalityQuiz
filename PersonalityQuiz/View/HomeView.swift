//
//  HomeView.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-27.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var quizViewModel: QuizViewModel
//    @ObservedObject var homeViewModel: HomeViewModel
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                VStack {
                    NavigationLink(destination: QuizView(
                        quizViewModel: quizViewModel),
                        isActive: self.$quizViewModel.showQuiz) {
                            Button(action: {
                                self.quizViewModel.startQuiz()
                            }) {
                                Text("Start Quiz")
                            }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static let quizViewModel = QuizViewModel()

    static var previews: some View {
        HomeView(quizViewModel: quizViewModel)
    }
}
