//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var billSteveFacts = [
        "Bill Gates": [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss.", ],
        "Steve Jobs": [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."]
    ]
    
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var disableSteve: UIButton!
    @IBOutlet weak var disableBill: UIButton!
    
    @IBOutlet weak var roundNum: UILabel!
    
    var score = 0
    var nineClicks = 0
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFact()
        roundNum.text = "Round \(round)/\("9")"
    }
    
    func showFact() {
        let fact = getRandomFact()
        factLabel.text = fact.1
        disableSteve.enabled = true
        disableBill.enabled = true
    }
    
    func gameOver() {
        factLabel.text = "You scored \(score) points!"
        disableBill.enabled = false
        disableSteve.enabled = false
        scoreLabel.text = ""
        roundNum.text = "Game Over!"
    }
    
    
    
    func getRandomFact() -> (String, String) {
        var randomFact: (String, String) = ("", "")
        let person = randomPerson()
        if person == "Steve Jobs" {
            let steveFact = (billSteveFacts["Steve Jobs"]![randomNumberFromZeroTo(4)])
            randomFact = ("Steve Jobs", steveFact)
        } else if person == "Bill Gates" {
            let billFact = (billSteveFacts["Bill Gates"]![randomNumberFromZeroTo(5)])
            randomFact = ("Bill Gates", billFact)
        }
        
        return randomFact
        
    }
    
    
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    
    @IBAction func touchSteve(sender: UIButton) {
        nineClicks += 1
        round += 1
        roundNum.text = "Round \(round)/\("9")"
        
        for fact in billSteveFacts["Steve Jobs"]! {
            if factLabel.text == fact {
                disableSteve.enabled = false
                if score < 9 {
                    score+=1
                }
                scoreLabel.text = "\(score)"
                if nineClicks >= 9 {
                    gameOver()
                } else {
                    showFact()
                }
            } else if nineClicks >= 9 {
                gameOver()
            } else {
                showFact()
            }
        }
    }

    
    
    @IBAction func touchBill(sender: UIButton) {
        nineClicks += 1
        round += 1
        roundNum.text = "Round \(round)/\("9")"
        
        for fact in billSteveFacts["Bill Gates"]! {
            if factLabel.text == fact {
                disableSteve.enabled = false
                if score < 9 {
                    score+=1
                }
                scoreLabel.text = "\(score)"
                if nineClicks >= 9 {
                    gameOver()
                } else {
                    showFact()
                }
            } else if nineClicks >= 9 {
                gameOver()
            } else {
                showFact()
            }
        }
    }
    
}