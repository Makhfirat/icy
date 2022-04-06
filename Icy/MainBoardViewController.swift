//
//  ViewController.swift
//  Icy
//
//  Created by Macbook on 3/14/22.
//

import UIKit

class MainBoardViewController: UIViewController
{
 
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var remainAttempt: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    var guessingNumber: Int = Int.random(in: 1...100)
    // number the player should guess
    
    var score: Int = 0
    // Score calculated by the player
    
    var attempt: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up initial values
        slider.value =  50
        
        // Set up Slider
        let normalThumbImage = UIImage (named:"SliderThumb-Normal")
        let highlitedThumbImage = UIImage(named:"SliderThumb-Highlighted")
        slider.setThumbImage(normalThumbImage, for: . normal)
        slider.setThumbImage(highlitedThumbImage, for: .highlighted)
        setUp()
        
        
    }

    @IBAction func didThumbSelectButton(_ sender: Any) {
        
        let sliderValueInt: Int = Int(slider . value )
        remainAttampt()
        // задача
        // 1. Прочитать число из слайдера
        let valueSlider: Float = slider.value
        
        //2. Перевести это число в Int(sliderValueInt),  чтобы можно было сравнить два цулых числа
        
        let IntValueSlider: Int = Int(slider.value)
        
        
        // 3. Сравнить два числа и еслт они совпадают , то вывести в консоль информацию ою этом
        let isValuesEquals = sliderValueInt == guessingNumber
        if  isValuesEquals {
            //добавить 1 очко
            score = score + 1
            // обновить значение текста для дейбла с очками
            scoreLabel.text = "Очки: \(score)"
            print ("You guessed the enumber ")
        }else {
            print ("You have selected the number \(slider.value)")
            
            taskLabel.text = "Попробуйте угадать чиcло: "  + String (guessingNumber)
        }
        
        updateGuessingNumber()
        
        
    }
    
    @IBAction func didTapTryAgainButton(_ sender: Any) {
        print ("Try Again Makhfirat")
        setUp()
    }
    
    func setUp () {
        // Setting up the game
        
        
        // 1.Set the slider value up to 50
            slider.value = 50
        // 2.Give a number to guess
        updateGuessingNumber()
            
            taskLabel.text = "Попробуйте угадать чиcло: "  + String (guessingNumber)
            
        // 3.Zerofy the scores
        score = 0
            scoreLabel.text = "Очки:" + String (score)
        //remainAttempt
        
    }
    func updateGuessingNumber() {
        guessingNumber = Int.random(in: 1...100)
        taskLabel.text = "Попробуйте угадать число: " + String(guessingNumber)
    }
    func remainAttampt() {
    attempt += 1
    remainAttempt.text = "Round: \(attempt)"
        if attempt >= 10 {
            attempt = 0
            
        }
   }
}
