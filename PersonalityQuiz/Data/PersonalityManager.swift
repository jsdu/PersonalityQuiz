//
//  PersonalityData.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-28.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

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
                color: ["FFCB52", "FF7B02"],
                famousName: ["Frank Sinatra",
                             "John D. Rockefeller",
                             "Judge Judy",
                             "Sonia Sotomayor"]
            ),
            .ESFJ: PersonalityModel(
                name: "Supporter",
                description: "",
                job: [],
                color: ["FFCB52", "FF7B02"],
                famousName: []
            ),
            .ISTJ: PersonalityModel(
                name: "Examiner",
                description: "",
                job: [],
                color: ["C165DD", "5C27FE"],
                famousName: []
            ),
            .ISFJ: PersonalityModel(
                name: "Defender",
                description: "",
                job: [],
                color: ["C165DD", "5C27FE"],
                famousName: []
            ),
            .ESTP: PersonalityModel(
                name: "Persuader",
                description: "",
                job: [],
                color: ["2AFEB7", "08C792"],
                famousName: []
            ),
            .ESFP: PersonalityModel(
                name: "Entertainer",
                description: "",
                job: [],
                color: ["2AFEB7", "08C792"],
                famousName: []
            ),
            .ISTP: PersonalityModel(
                name: "Craftsman",
                description: "",
                job: [],
                color: ["5581F1", "1153FC"],
                famousName: []
            ),
            .ISFP: PersonalityModel(
                name: "Artist",
                description: "",
                job: [],
                color: ["5581F1", "1153FC"],
                famousName: []
            ),
            .ENTJ: PersonalityModel(
                name: "Chief",
                description: "",
                job: [],
                color: ["FACD68", "FC76B3"],
                famousName: []
            ),
            .ENTP: PersonalityModel(
                name: "Originator",
                description: "",
                job: [],
                color: ["FACD68", "FC76B3"],
                famousName: []
            ),
            .INTJ: PersonalityModel(
                name: "Strategist",
                description: "",
                job: [],
                color: ["00F7A7", "04F5ED"],
                famousName: []
            ),
            .INTP: PersonalityModel(
                name: "Engineer",
                description: "",
                job: [],
                color: ["00F7A7", "04F5ED"],
                famousName: []
            ),
            .ENFJ: PersonalityModel(
                name: "Mentor",
                description: "",
                job: [],
                color: ["1DE5E2", "B588F7"],
                famousName: ["Martin Luther King", "Oprah Winfrey", "John Paul II"]
            ),
            .ENFP: PersonalityModel(
                name: "Advocate",
                description: "",
                job: [],
                color: ["1DE5E2", "B588F7"],
                famousName: []
            ),
            .INFJ: PersonalityModel(
                name: "Confidant",
                description: "",
                job: [],
                color: ["FFE324", "FFB533"],
                famousName: []
            ),
            .INFP: PersonalityModel(
                name: "Dreamer",
                description: "",
                job: [],
                color: ["FFE324", "FFB533"],
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
