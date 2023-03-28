//
//  ViewController.swift
//  QuizApp
//
//  Created by Bartuğ Kaan Çelebi on 27.03.2023.
//

import UIKit

class ViewController: UIViewController {
    var quizBrain = QuizBrain()
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1Button: UIButton!
    
    @IBOutlet weak var answer2Button: UIButton!
    
    @IBOutlet weak var answer3Button: UIButton!
    
    @IBOutlet weak var progresView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight{
            scoreLabel.backgroundColor = UIColor.green
        }
        else{
            scoreLabel.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.returnText()
        answer1Button.setTitle(quizBrain.retunOptions(buttonIndex: 0), for: .normal)
        answer2Button.setTitle(quizBrain.retunOptions(buttonIndex: 1), for: .normal)
        answer3Button.setTitle(quizBrain.retunOptions(buttonIndex: 2), for: .normal)
        progresView.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        scoreLabel.backgroundColor = UIColor.clear
    }
}

