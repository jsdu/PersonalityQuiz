//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-12.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var additionalQuizView: UIView!
    @IBOutlet weak var addionalQuizViewButton: UIButton!
    @IBOutlet weak var additionalQuizViewHeight: NSLayoutConstraint!
    @IBOutlet weak var extrovertLabel: UILabel!
    @IBOutlet weak var extrovertPercent: UILabel!
    @IBOutlet weak var intuitiveLabel: UILabel!
    @IBOutlet weak var intuitivePercent: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var feelingPercent: UILabel!
    @IBOutlet weak var judgingLabel: UILabel!
    @IBOutlet weak var judgingPercent: UILabel!
    @IBOutlet weak var assertiveLabel: UILabel!
    @IBOutlet weak var assertivePercent: UILabel!
    @IBOutlet weak var personalityLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!

    var quizManager: QuizViewModel!
//    let personalityManager = PersonalityManager()
    var personality: PersonalityModel!
    var score: [CharacterType: Double]!

    override func viewDidLoad() {
        super.viewDidLoad()
        score = quizManager.getScore()
//        personality = personalityManager.personalityType[personalityManager.calculatePersonality(score)]
        formatUI()
        updateUI()
    }

    func updateUI() {

//        personalityLabel.text = personalityManager.personalityType[personalityManager.calculatePersonality(score)]?.name

//        extrovertLabel.text = personalityManager.getPersonality(personalityType: .extrovert, positive: score[.extrovert]! > 0)
//        intuitiveLabel.text = personalityManager.getPersonality(personalityType: .intuitive, positive: score[.intuitive]! > 0)
//        feelingLabel.text = personalityManager.getPersonality(personalityType: .feeling, positive: score[.feeling]! > 0)
//        judgingLabel.text = personalityManager.getPersonality(personalityType: .judging, positive: score[.judging]! > 0)
//        assertiveLabel.text = personalityManager.getPersonality(personalityType: .assertive, positive: score[.assertive]! > 0)

        extrovertPercent.text = "\(abs(Int(score[.extrovert]! * 100)))"
        intuitivePercent.text = "\(abs(Int(score[.intuitive]! * 100)))"
        feelingPercent.text = "\(abs(Int(score[.feeling]! * 100)))"
        judgingPercent.text = "\(abs(Int(score[.judging]! * 100)))"
        assertivePercent.text = "\(abs(Int(score[.assertive]! * 100)))"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAdditionalQuizViewController" {
            if let quizViewController = segue.destination as? QuizViewController {
                quizViewController.quizManager = quizManager
                quizManager.setupAdditionalQuestions()
            }
        }
    }
}

// UI
extension ResultsViewController {

    override func viewWillLayoutSubviews() {
//        imageOne.makeRounded()
//        imageTwo.makeRounded()
//        imageThree.makeRounded()
    }

    func formatUI() {
        if quizManager.answers.count > 50 {
            additionalQuizView.isHidden = true
            additionalQuizViewHeight.constant = 0
        }

        backgroundView.layer.masksToBounds = false
        let gradient = makeGradient(bounds: backgroundView.bounds, alpha: 0.90)
        backgroundView.layer.insertSublayer(gradient, at: 0)

        addionalQuizViewButton.layer.cornerRadius = 15.0
        addionalQuizViewButton.layer.masksToBounds = true
    }

    func makeGradient(bounds: CGRect, alpha: CGFloat) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = [hexStringToUIColor(hex: personality.color[0], alpha).cgColor,
                        hexStringToUIColor(hex: personality.color[1], alpha).cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        return layer
    }

    // Utility function from https://stackoverflow.com/questions/24263007/how-to-use-hex-color-values
    func hexStringToUIColor (hex: String, _ alpha: CGFloat) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

// https://stackoverflow.com/questions/28074679/how-to-set-image-in-circle-in-swift
extension UIImageView {

    func makeRounded() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
