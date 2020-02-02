//
//  Personality.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-12.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

struct PersonalityContainer {
    let personalityModel: PersonalityModel
    let personalityName: String // INTJ-A
    let personality: [CharacterType: String] // Introvert, Intuitive, ...
}

struct PersonalityModel {
    let name: String
    let description: String
    let job: [String]
    let color: [String]
    let famousName: [String]
}

enum PersonalityType: String {
    case ESTJ
    case ESFJ
    case ISTJ
    case ISFJ
    case ESTP
    case ESFP
    case ISTP
    case ISFP
    case ENTJ
    case ENTP
    case INTJ
    case INTP
    case ENFJ
    case ENFP
    case INFJ
    case INFP
}

enum CharacterType: String, CaseIterable {
    case extrovert
    case intuitive
    case feeling
    case judging
    case assertive
}

extension CharacterType: Identifiable {
    var id: String {
        rawValue
    }
}
