//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-10.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var backButton: UIButton!

    @IBOutlet weak var progressView: UIProgressView!

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!

    var quizManager: QuizViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if quizManager == nil {
            quizManager = QuizViewModel()
        }
        formatUI()
        updateUI()
    }

    func identifyButton(_ tag: Int) -> AnswerType {
        switch tag {
        case 0:
            return .stronglyAgree
        case 1:
            return .agree
        case 2:
            return .neutral
        case 3:
            return .disagree
        case 5:
            return .stronglyDisagree
        default:
            return .neutral
        }
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        quizManager.previousQuestion()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        quizManager.submitAnswer(answer: identifyButton(sender.tag))

        if quizManager.currentQuestionIndex == quizManager.quiz.count {
             performSegue(withIdentifier: "toResultsViewController", sender: nil)
        } else {
            updateUI()
        }
    }

    func formatUI() {
        setupButton(buttonOne)
        setupButton(buttonTwo)
        setupButton(buttonThree)
        setupButton(buttonFour)
        setupButton(buttonFive)
    }

    func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = 2.0
        button.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.masksToBounds = false
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 6.0

    }

    @objc func updateUI() {
        titleLabel.text = "\(quizManager.currentQuestionIndex + 1) of \(quizManager.quiz.count)"
        questionLabel.text = quizManager.getCurrentQuestion().question
        progressView.progress = Float(quizManager.currentQuestionIndex + 1)/Float(quizManager.quiz.count)

        if quizManager.currentQuestionIndex == 0 {
            backButton.isHidden = true
        } else {
            backButton.isHidden = false
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultsViewController" {
            if let resultsViewController = segue.destination as? ResultsViewController {
                resultsViewController.quizManager = quizManager
            }
        }
    }
}
