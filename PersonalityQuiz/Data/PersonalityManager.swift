//
//  PersonalityData.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-28.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation
import SwiftUI

struct PersonalityManager {
    let personalityType: [PersonalityType: PersonalityModel]

    public func calculatePersonality(_ score: [CharacterType: Double]) -> PersonalityContainer {
        var personality = ""

        let extrovert = getCharacteristic(personalityType: .extrovert, positive: score[.extrovert]! > 0.0)
        let intuitive = getCharacteristic(personalityType: .intuitive, positive: score[.intuitive]! > 0.0)
        let feeling = getCharacteristic(personalityType: .feeling, positive: score[.feeling]! > 0.0)
        let judging = getCharacteristic(personalityType: .judging, positive: score[.judging]! > 0.0)
        let assertive = getCharacteristic(personalityType: .assertive, positive: score[.assertive]! > 0.0)

        personality.append(extrovert)
        personality.append(intuitive)
        personality.append(feeling)
        personality.append(judging)

        let personalityType = PersonalityType(rawValue: personality)!
        personality.append("-")
        personality.append(assertive)

        return PersonalityContainer(personalityModel: self.personalityType[personalityType]!,
                                    personalityName: personality,
                                    personality: [.extrovert: getCharacterName(personalityType: .extrovert, positive: score[.extrovert]! > 0.0),
                                                  .intuitive: getCharacterName(personalityType: .intuitive, positive: score[.intuitive]! > 0.0),
                                                  .feeling: getCharacterName(personalityType: .feeling, positive: score[.feeling]! > 0.0),
                                                  .judging: getCharacterName(personalityType: .judging, positive: score[.judging]! > 0.0),
                                                  .assertive: getCharacterName(personalityType: .assertive, positive: score[.assertive]! > 0.0)])
    }

    // swiftlint:disable function_body_length
    init() {

        // Gradients from https://www.uplabs.com/posts/gradient-palettes
        personalityType = [
            .ESTJ: PersonalityModel(
                name: "Overseer",
                description: "asdf",
                job: [],
                color: [Color(#colorLiteral(red: 1, green: 0.7960784314, blue: 0.3215686275, alpha: 0.8956866197)), Color(#colorLiteral(red: 1, green: 0.4823529412, blue: 0.007843137255, alpha: 0.8993177817))],
                famousName: ["Frank Sinatra",
                             "John D. Rockefeller",
                             "Judge Judy",
                             "Sonia Sotomayor"]
            ),
            .ESFJ: PersonalityModel(
                name: "Supporter",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 1, green: 0.7960784314, blue: 0.3215686275, alpha: 0.9)), Color(#colorLiteral(red: 1, green: 0.4823529412, blue: 0.007843137255, alpha: 0.9))],
                famousName: []
            ),
            .ISTJ: PersonalityModel(
                name: "Examiner",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0.7568627451, green: 0.3960784314, blue: 0.8666666667, alpha: 0.9)), Color(#colorLiteral(red: 0.3607843137, green: 0.1529411765, blue: 0.9960784314, alpha: 0.9))],
                famousName: []
            ),
            .ISFJ: PersonalityModel(
                name: "Defender",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0.7568627451, green: 0.3960784314, blue: 0.8666666667, alpha: 0.9)), Color(#colorLiteral(red: 0.3607843137, green: 0.1529411765, blue: 0.9960784314, alpha: 0.9))],
                famousName: []
            ),
            .ESTP: PersonalityModel(
                name: "Persuader",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0.1647058824, green: 0.9960784314, blue: 0.7176470588, alpha: 0.9)), Color(#colorLiteral(red: 0.03137254902, green: 0.7803921569, blue: 0.5725490196, alpha: 0.9))],
                famousName: []
            ),
            .ESFP: PersonalityModel(
                name: "Entertainer",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0.1647058824, green: 0.9960784314, blue: 0.7176470588, alpha: 0.9)), Color(#colorLiteral(red: 0.03137254902, green: 0.7803921569, blue: 0.5725490196, alpha: 0.9))],
                famousName: []
            ),
            .ISTP: PersonalityModel(
                name: "Craftsman",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0.3333333333, green: 0.5058823529, blue: 0.9450980392, alpha: 0.9011333627)), Color(#colorLiteral(red: 0.06666666667, green: 0.3254901961, blue: 0.9882352941, alpha: 0.8955215669))],
                famousName: []
            ),
            .ISFP: PersonalityModel(
                name: "Artist",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0.3333333333, green: 0.5058823529, blue: 0.9450980392, alpha: 0.9)), Color(#colorLiteral(red: 0.06666666667, green: 0.3254901961, blue: 0.9882352941, alpha: 0.9))],
                famousName: []
            ),
            .ENTJ: PersonalityModel(
                name: "Chief",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0.9803921569, green: 0.8039215686, blue: 0.4078431373, alpha: 0.9)), Color(#colorLiteral(red: 0.9882352941, green: 0.462745098, blue: 0.7019607843, alpha: 0.9))],
                famousName: []
            ),
            .ENTP: PersonalityModel(
                name: "Originator",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0.9803921569, green: 0.8039215686, blue: 0.4078431373, alpha: 0.9)), Color(#colorLiteral(red: 0.9882352941, green: 0.462745098, blue: 0.7019607843, alpha: 0.9))],
                famousName: []
            ),
            .INTJ: PersonalityModel(
                name: "Strategist",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0, green: 0.968627451, blue: 0.6549019608, alpha: 0.9)), Color(#colorLiteral(red: 0.01568627451, green: 0.9607843137, blue: 0.9294117647, alpha: 0.9))],
                famousName: []
            ),
            .INTP: PersonalityModel(
                name: "Engineer",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0, green: 0.968627451, blue: 0.6549019608, alpha: 0.9)), Color(#colorLiteral(red: 0.01568627451, green: 0.9607843137, blue: 0.9294117647, alpha: 0.9))],
                famousName: []
            ),
            .ENFJ: PersonalityModel(
                name: "Mentor",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0, green: 0.968627451, blue: 0.6549019608, alpha: 0.9)), Color(#colorLiteral(red: 0.7098039216, green: 0.5333333333, blue: 0.968627451, alpha: 0.9))],
                famousName: ["Martin Luther King", "Oprah Winfrey", "John Paul II"]
            ),
            .ENFP: PersonalityModel(
                name: "Advocate",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 0, green: 0.968627451, blue: 0.6549019608, alpha: 0.9)), Color(#colorLiteral(red: 0.7098039216, green: 0.5333333333, blue: 0.968627451, alpha: 0.9))],
                famousName: []
            ),
            .INFJ: PersonalityModel(
                name: "Confidant",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 1, green: 0.8901960784, blue: 0.1411764706, alpha: 0.9)), Color(#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2, alpha: 0.9))],
                famousName: []
            ),
            .INFP: PersonalityModel(
                name: "Dreamer",
                description: "",
                job: [],
                color: [Color(#colorLiteral(red: 1, green: 0.8901960784, blue: 0.1411764706, alpha: 0.9)), Color(#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2, alpha: 0.9))],
                famousName: []
            )
        ]
    }

    private func getCharacteristic(personalityType: CharacterType, positive: Bool) -> String {
        switch personalityType {
        case .extrovert:
            return positive ? "E" : "I"
        case .intuitive:
            return positive ? "N" : "S"
        case .feeling:
            return positive ? "F" : "T"
        case .judging:
            return positive ? "J" : "P"
        case .assertive:
            return positive ? "A" : "T"
        }
    }

    private func getCharacterName(personalityType: CharacterType, positive: Bool) -> String {
        switch personalityType {
        case .extrovert:
            return positive ? "Entroverted" : "Introverted"
        case .intuitive:
            return positive ? "Intuitive" : "Observant"
        case .feeling:
            return positive ? "Feeling" : "Thinking"
        case .judging:
            return positive ? "Judging" : "Perceiving"
        case .assertive:
            return positive ? "Assertive" : "Turbulent"
        }
    }
}
