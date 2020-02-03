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
    let personalityLabel: [CharacterType: (String, String)]

    public func calculatePersonality(_ score: [CharacterType: Double]) -> PersonalityContainer {
        var personality = ""

        let extrovert = getCharacteristic(personalityType: .extrovert, positive: score[.extrovert]! > 0.5)
        let intuitive = getCharacteristic(personalityType: .intuitive, positive: score[.intuitive]! > 0.5)
        let feeling = getCharacteristic(personalityType: .feeling, positive: score[.feeling]! > 0.5)
        let judging = getCharacteristic(personalityType: .judging, positive: score[.judging]! > 0.5)
        let assertive = getCharacteristic(personalityType: .assertive, positive: score[.assertive]! > 0.5)

        personality.append(extrovert)
        personality.append(intuitive)
        personality.append(feeling)
        personality.append(judging)

        let personalityType = PersonalityType(rawValue: personality)!
        personality.append("-")
        personality.append(assertive)

        // swiftlint:disable line_length
        return PersonalityContainer(personalityModel: self.personalityType[personalityType]!,
                                    personalityName: personality)
    }

    // swiftlint:disable function_body_length
    init() {
        personalityLabel = [
            .extrovert: ("Introvert", "Extrovert"),
            .intuitive: ("Observant", "Intuitive"),
            .feeling: ("Thinking", "Feeling"),
            .judging: ("Perceiving", "Judging"),
            .assertive: ("Turbulent", "Assertive")
        ]

        // Gradients from https://www.uplabs.com/posts/gradient-palettes
        personalityType = [
            .ESTJ: PersonalityModel(
                name: "Overseer",
                description: "Overseers are hardworking traditionalists, eager to take charge in organizing projects and people. Orderly, rule-abiding, and conscientious, Overseers like to get things done, and tend to go about projects in a systematic, methodical way.",
                job: [],
                color: [Color(#colorLiteral(red: 1, green: 0.7960784314, blue: 0.3215686275, alpha: 0.8956866197)), Color(#colorLiteral(red: 1, green: 0.4823529412, blue: 0.007843137255, alpha: 0.8993177817))],
                famousName: ["Frank Sinatra",
                             "John D. Rockefeller",
                             "Judge Judy",
                             "Sonia Sotomayor"]
            ),
            .ESFJ: PersonalityModel(
                name: "Supporter",
                description: "Supporters are conscientious helpers, sensitive to the needs of others and energetically dedicated to their responsibilities. They are highly attuned to their emotional environment and attentive to both the feelings of others and the perception others have of them. Supporters like a sense of harmony and cooperation around them, and are eager to please and provide.",
                job: [],
                color: [Color(#colorLiteral(red: 1, green: 0.7960784314, blue: 0.3215686275, alpha: 0.9)), Color(#colorLiteral(red: 1, green: 0.4823529412, blue: 0.007843137255, alpha: 0.9))],
                famousName: []
            ),
            .ISTJ: PersonalityModel(
                name: "Examiner",
                description: "Examiners are responsible organizers, driven to create and enforce order within systems and institutions. They are neat and orderly, inside and out, and tend to have a procedure for everything they do.",
                job: [],
                color: [Color(#colorLiteral(red: 0.7568627451, green: 0.3960784314, blue: 0.8666666667, alpha: 0.9)), Color(#colorLiteral(red: 0.3607843137, green: 0.1529411765, blue: 0.9960784314, alpha: 0.9))],
                famousName: []
            ),
            .ISFJ: PersonalityModel(
                name: "Defender",
                description: "Defenders are industrious caretakers, loyal to traditions and organizations. They are practical, compassionate, and caring, and are motivated to provide for others and protect them from the perils of life.",
                job: [],
                color: [Color(#colorLiteral(red: 0.7568627451, green: 0.3960784314, blue: 0.8666666667, alpha: 0.9)), Color(#colorLiteral(red: 0.3607843137, green: 0.1529411765, blue: 0.9960784314, alpha: 0.9))],
                famousName: []
            ),
            .ESTP: PersonalityModel(
                name: "Persuader",
                description: "Persuaders are energetic thrillseekers who are at their best when putting out fires, whether literal or metaphorical. They bring a sense of dynamic energy to their interactions with others and the world around them. ESTPs assess situations quickly and move adeptly to respond to immediate problems with practical solutions.",
                job: [],
                color: [Color(#colorLiteral(red: 0.1647058824, green: 0.9960784314, blue: 0.7176470588, alpha: 0.9)), Color(#colorLiteral(red: 0.03137254902, green: 0.7803921569, blue: 0.5725490196, alpha: 0.9))],
                famousName: []
            ),
            .ESFP: PersonalityModel(
                name: "Entertainer",
                description: "Entertainers are vivacious entertainers who charm and engage those around them. They are spontaneous, energetic, and fun-loving, and take pleasure in the things around them: food, clothes, nature, animals, and especially people.",
                job: [],
                color: [Color(#colorLiteral(red: 0.1647058824, green: 0.9960784314, blue: 0.7176470588, alpha: 0.9)), Color(#colorLiteral(red: 0.03137254902, green: 0.7803921569, blue: 0.5725490196, alpha: 0.9))],
                famousName: []
            ),
            .ISTP: PersonalityModel(
                name: "Craftsman",
                description: "Craftsmans are observant artisans with an understanding of mechanics and an interest in troubleshooting. They approach their environments with a flexible logic, looking for practical solutions to the problems at hand.",
                job: [],
                color: [Color(#colorLiteral(red: 0.3333333333, green: 0.5058823529, blue: 0.9450980392, alpha: 0.9011333627)), Color(#colorLiteral(red: 0.06666666667, green: 0.3254901961, blue: 0.9882352941, alpha: 0.8955215669))],
                famousName: []
            ),
            .ISFP: PersonalityModel(
                name: "Artist",
                description: "Artists are gentle caretakers who live in the present moment and enjoy their surroundings with cheerful, low-key enthusiasm. They are flexible and spontaneous, and like to go with the flow to enjoy what life has to offer.",
                job: [],
                color: [Color(#colorLiteral(red: 0.3333333333, green: 0.5058823529, blue: 0.9450980392, alpha: 0.9)), Color(#colorLiteral(red: 0.06666666667, green: 0.3254901961, blue: 0.9882352941, alpha: 0.9))],
                famousName: []
            ),
            .ENTJ: PersonalityModel(
                name: "Chief",
                description: "Chiefs are strategic leaders, motivated to organize change. They are quick to see inefficiency and conceptualize new solutions, and enjoy developing long-range plans to accomplish their vision. They excel at logical reasoning and are usually articulate and quick-witted.",
                job: [],
                color: [Color(#colorLiteral(red: 0.9803921569, green: 0.8039215686, blue: 0.4078431373, alpha: 0.9)), Color(#colorLiteral(red: 0.9882352941, green: 0.462745098, blue: 0.7019607843, alpha: 0.9))],
                famousName: []
            ),
            .ENTP: PersonalityModel(
                name: "Originator",
                description: "Originators are inspired innovators, motivated to find new solutions to intellectually challenging problems. They are curious and clever, and seek to comprehend the people, systems, and principles that surround them. Open-minded and unconventional, Visionaries want to analyze, understand, and influence other people.",
                job: [],
                color: [Color(#colorLiteral(red: 0.9803921569, green: 0.8039215686, blue: 0.4078431373, alpha: 0.9)), Color(#colorLiteral(red: 0.9882352941, green: 0.462745098, blue: 0.7019607843, alpha: 0.9))],
                famousName: []
            ),
            .INTJ: PersonalityModel(
                name: "Strategist",
                description: "Strategists are analytical problem-solvers, eager to improve systems and processes with their innovative ideas. They have a talent for seeing possibilities for improvement, whether at work, at home, or in themselves.",
                job: [],
                color: [Color(#colorLiteral(red: 0, green: 0.968627451, blue: 0.6549019608, alpha: 0.9)), Color(#colorLiteral(red: 0.01568627451, green: 0.9607843137, blue: 0.9294117647, alpha: 0.9))],
                famousName: []
            ),
            .INTP: PersonalityModel(
                name: "Engineer",
                description: "Engineers are philosophical innovators, fascinated by logical analysis, systems, and design. They are preoccupied with theory, and search for the universal law behind everything they see. They want to understand the unifying themes of life, in all their complexity.",
                job: [],
                color: [Color(#colorLiteral(red: 0, green: 0.968627451, blue: 0.6549019608, alpha: 0.9)), Color(#colorLiteral(red: 0.01568627451, green: 0.9607843137, blue: 0.9294117647, alpha: 0.9))],
                famousName: []
            ),
            .ENFJ: PersonalityModel(
                name: "Mentor",
                description: "Mentors are idealist organizers, driven to implement their vision of what is best for humanity. They often act as catalysts for human growth because of their ability to see potential in other people and their charisma in persuading others to their ideas.",
                job: [],
                color: [Color(#colorLiteral(red: 0, green: 0.968627451, blue: 0.6549019608, alpha: 0.9)), Color(#colorLiteral(red: 0.7098039216, green: 0.5333333333, blue: 0.968627451, alpha: 0.9))],
                famousName: ["Martin Luther King", "Oprah Winfrey", "John Paul II"]
            ),
            .ENFP: PersonalityModel(
                name: "Advocate",
                description: "Advocates are people-centered creators with a focus on possibilities and a contagious enthusiasm for new ideas, people and activities. Energetic, warm, and passionate, Advocates love to help other people explore their their creative potential.",
                job: [],
                color: [Color(#colorLiteral(red: 0, green: 0.968627451, blue: 0.6549019608, alpha: 0.9)), Color(#colorLiteral(red: 0.7098039216, green: 0.5333333333, blue: 0.968627451, alpha: 0.9))],
                famousName: []
            ),
            .INFJ: PersonalityModel(
                name: "Confidant",
                description: "Confidants are creative nurturers with a strong sense of personal integrity and a drive to help others realize their potential. Creative and dedicated, they have a talent for helping others with original solutions to their personal challenges.",
                job: [],
                color: [Color(#colorLiteral(red: 1, green: 0.8901960784, blue: 0.1411764706, alpha: 0.9)), Color(#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2, alpha: 0.9))],
                famousName: []
            ),
            .INFP: PersonalityModel(
                name: "Dreamer",
                description: "Dreamers are imaginative idealists, guided by their own core values and beliefs. To a Healer, possibilities are paramount; the realism of the moment is only of passing concern. They see potential for a better future, and pursue truth and meaning with their own individual flair.",
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
}
