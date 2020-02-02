//
//  QuestionManager.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-11.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

struct QuestionManager {

    // Questions from https://ipip.ori.org/newMultipleconstructs.htm
    var possibleExtrovertQuestions = [
        Question(question: "Am the life of the party.", questionType: .extrovert, isPositive: true),
        Question(question: "Feel comfortable around people.", questionType: .extrovert, isPositive: true),
        Question(question: "Start conversations.", questionType: .extrovert, isPositive: true),
        Question(question: "Talk to a lot of different people at parties.", questionType: .extrovert, isPositive: true),
        Question(question: "Don't mind being the center of attention.", questionType: .extrovert, isPositive: true),
        Question(question: "Make friends easily.", questionType: .extrovert, isPositive: true),
        Question(question: "Take charge.", questionType: .extrovert, isPositive: true),
        Question(question: "Know how to captivate people.", questionType: .extrovert, isPositive: true),
        Question(question: "Feel at ease with people.", questionType: .extrovert, isPositive: true),
        Question(question: "Am skilled in handling social situations.", questionType: .extrovert, isPositive: true),
        Question(question: "Find it difficult to approach others.", questionType: .extrovert, isPositive: false),
        Question(question: "Often feel uncomfortable around others.", questionType: .extrovert, isPositive: false),
        Question(question: "Bottle up my feelings.", questionType: .extrovert, isPositive: false),
        Question(question: "Am a very private person.", questionType: .extrovert, isPositive: false),
        Question(question: "Wait for others to lead the way.", questionType: .extrovert, isPositive: false),
        Question(question: "Don't talk a lot.", questionType: .extrovert, isPositive: false),
        Question(question: "Keep in the background.", questionType: .extrovert, isPositive: false),
        Question(question: "Have little to say.", questionType: .extrovert, isPositive: false),
        Question(question: "Don't like to draw attention to myself.", questionType: .extrovert, isPositive: false),
        Question(question: "Am quiet around strangers.", questionType: .extrovert, isPositive: false)
    ]

    var possibleIntuitiveQuestions = [
        Question(question: "Have a rich vocabulary.", questionType: .intuitive, isPositive: true),
        Question(question: "Have a vivid imagination.", questionType: .intuitive, isPositive: true),
        Question(question: "Have excellent ideas.", questionType: .intuitive, isPositive: true),
        Question(question: "Am quick to understand things.", questionType: .intuitive, isPositive: true),
        Question(question: "Use difficult words.", questionType: .intuitive, isPositive: true),
        Question(question: "Spend time reflecting on things.", questionType: .intuitive, isPositive: true),
        Question(question: "Am full of ideas.", questionType: .intuitive, isPositive: true),
        Question(question: "Carry the conversation to a higher level.", questionType: .intuitive, isPositive: true),
        Question(question: "Catch on to things quickly.", questionType: .intuitive, isPositive: true),
        Question(question: "Can handle a lot of information.", questionType: .intuitive, isPositive: true),
        Question(question: "Love to think up new ways of doing things.", questionType: .intuitive, isPositive: true),
        Question(question: "Love to read challenging material.", questionType: .intuitive, isPositive: true),
        Question(question: "Am good at many things.", questionType: .intuitive, isPositive: true),
        Question(question: "Have difficulty understanding abstract ideas.",
                 questionType: .intuitive, isPositive: false),
        Question(question: "Am not interested in abstract ideas.", questionType: .intuitive, isPositive: false),
        Question(question: "Do not have a good imagination.", questionType: .intuitive, isPositive: false),
        Question(question: "Try to avoid complex people.", questionType: .intuitive, isPositive: false),
        Question(question: "Have difficulty imagining things.", questionType: .intuitive, isPositive: false),
        Question(question: "Avoid difficult reading material.", questionType: .intuitive, isPositive: false),
        Question(question: "Will not probe deeply into a subject.", questionType: .intuitive, isPositive: false)
    ]

    var possibleFeelingQuestions = [
        Question(question: "Am interested in people.", questionType: .feeling, isPositive: true),
        Question(question: "Sympathize with others' feelings.", questionType: .feeling, isPositive: true),
        Question(question: "Have a soft heart.", questionType: .feeling, isPositive: true),
        Question(question: "Take time out for others.", questionType: .feeling, isPositive: true),
        Question(question: "Feel others' emotions.", questionType: .feeling, isPositive: true),
        Question(question: "Make people feel at ease.", questionType: .feeling, isPositive: true),
        Question(question: "Inquire about others' well-being.", questionType: .feeling, isPositive: true),
        Question(question: "Know how to comfort others.", questionType: .feeling, isPositive: true),
        Question(question: "Love children.", questionType: .feeling, isPositive: true),
        Question(question: "Am on good terms with nearly everyone.", questionType: .feeling, isPositive: true),
        Question(question: "Have a good word for everyone.", questionType: .feeling, isPositive: true),
        Question(question: "Show my gratitude.", questionType: .feeling, isPositive: true),
        Question(question: "Think of others first.", questionType: .feeling, isPositive: true),
        Question(question: "Love to help others.", questionType: .feeling, isPositive: true),
        Question(question: "Am not really interested in others.", questionType: .feeling, isPositive: false),
        Question(question: "Insult people.", questionType: .feeling, isPositive: false),
        Question(question: "Am not interested in other people's problems.", questionType: .feeling, isPositive: false),
        Question(question: "Feel little concern for others.", questionType: .feeling, isPositive: false),
        Question(question: "Am hard to get to know.", questionType: .feeling, isPositive: false),
        Question(question: "Am indifferent to the feelings of others.", questionType: .feeling, isPositive: false)
    ]

    var possibleJudgingQuestions = [
        Question(question: "Am always prepared.", questionType: .judging, isPositive: true),
        Question(question: "Pay attention to details.", questionType: .judging, isPositive: true),
        Question(question: "Get chores done right away.", questionType: .judging, isPositive: true),
        Question(question: "Like order.", questionType: .judging, isPositive: true),
        Question(question: "Follow a schedule.", questionType: .judging, isPositive: true),
        Question(question: "Am exacting in my work.", questionType: .judging, isPositive: true),
        Question(question: "Do things according to a plan.", questionType: .judging, isPositive: true),
        Question(question: "Continue until everything is perfect.", questionType: .judging, isPositive: true),
        Question(question: "Make plans and stick to them.", questionType: .judging, isPositive: true),
        Question(question: "Love order and regularity.", questionType: .judging, isPositive: true),
        Question(question: "Like to tidy up.", questionType: .judging, isPositive: true),
        Question(question: "Leave my belongings around.", questionType: .judging, isPositive: false),
        Question(question: "Make a mess of things.", questionType: .judging, isPositive: false),
        Question(question: "Often forget to put things back in their proper place.",
                 questionType: .judging, isPositive: false),
        Question(question: "Shirk my duties.", questionType: .judging, isPositive: false),
        Question(question: "Neglect my duties.", questionType: .judging, isPositive: false),
        Question(question: "Waste my time.", questionType: .judging, isPositive: false),
        Question(question: "Do things in a half-way manner.", questionType: .judging, isPositive: false),
        Question(question: "Find it difficult to get down to work.", questionType: .judging, isPositive: false),
        Question(question: "Leave a mess in my room.", questionType: .judging, isPositive: false)
    ]

    var possibleAssertiveQuestions = [
        Question(question: "Am relaxed most of the time.", questionType: .assertive, isPositive: true),
        Question(question: "Seldom feel blue.", questionType: .assertive, isPositive: true),
        Question(question: "Am not easily bothered by things.", questionType: .assertive, isPositive: true),
        Question(question: "Rarely get irritated.", questionType: .assertive, isPositive: true),
        Question(question: "Seldom get mad.", questionType: .assertive, isPositive: true),
        Question(question: "Get stressed out easily.", questionType: .assertive, isPositive: false),
        Question(question: "Worry about things.", questionType: .assertive, isPositive: false),
        Question(question: "Am easily disturbed.", questionType: .assertive, isPositive: false),
        Question(question: "Get upset easily.", questionType: .assertive, isPositive: false),
        Question(question: "Change my mood a lot.", questionType: .assertive, isPositive: false),
        Question(question: "Have frequent mood swings.", questionType: .assertive, isPositive: false),
        Question(question: "Get irritated easily.", questionType: .assertive, isPositive: false),
        Question(question: "Often feel blue.", questionType: .assertive, isPositive: false),
        Question(question: "Get angry easily.", questionType: .assertive, isPositive: false),
        Question(question: "Panic easily.", questionType: .assertive, isPositive: false),
        Question(question: "Feel threatened easily.", questionType: .assertive, isPositive: false),
        Question(question: "Get overwhelmed by emotions.", questionType: .assertive, isPositive: false),
        Question(question: "Take offense easily.", questionType: .assertive, isPositive: false),
        Question(question: "Get caught up in my problems.", questionType: .assertive, isPositive: false),
        Question(question: "Grumble about things.", questionType: .assertive, isPositive: false)
    ]

    mutating func getQuestions() -> [Question] {
        var quiz: [Question] = []

        getQuestions(questions: &quiz, possibleQuestions: &possibleExtrovertQuestions)
        getQuestions(questions: &quiz, possibleQuestions: &possibleIntuitiveQuestions)
        getQuestions(questions: &quiz, possibleQuestions: &possibleFeelingQuestions)
        getQuestions(questions: &quiz, possibleQuestions: &possibleJudgingQuestions)
        getQuestions(questions: &quiz, possibleQuestions: &possibleAssertiveQuestions)

        quiz.shuffle()

        return quiz
    }

    mutating func getAdditionalQuestions() -> [Question] {
        var additionalQuiz: [Question] = []

        additionalQuiz.append(contentsOf: possibleExtrovertQuestions)
        additionalQuiz.append(contentsOf: possibleIntuitiveQuestions)
        additionalQuiz.append(contentsOf: possibleFeelingQuestions)
        additionalQuiz.append(contentsOf: possibleJudgingQuestions)
        additionalQuiz.append(contentsOf: possibleAssertiveQuestions)

        additionalQuiz.shuffle()

        return additionalQuiz
    }

    fileprivate func getQuestions(questions: inout [Question], possibleQuestions: inout [Question]) {
        for _ in 0 ..< 10 {
            let randomIndex = Int(arc4random_uniform(UInt32(possibleQuestions.count)))
            questions.append(possibleQuestions[randomIndex])
            possibleQuestions.remove(at: randomIndex)
        }
    }
}
