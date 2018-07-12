//
//  OnePlayerGameViewController.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-12.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class OnePlayerGameViewController: UIViewController {

    //One Player Game page
    var gameInfo = GameInfo()
    
    //the objects that will be hidden and unhidden
    @IBOutlet weak var goHomeState_bttn: UIButton!
    @IBOutlet weak var resumeState_bttn: UIButton!
    @IBOutlet weak var puaseView_view: UIView!
    @IBOutlet weak var time_lbl: UILabel!
    @IBOutlet weak var score_lbl: UILabel!
    @IBOutlet weak var gameOver_lbl: UILabel!
    @IBOutlet weak var secondsIn_lbl: UILabel!
    @IBOutlet weak var timeDone_lbl: UILabel!
    @IBOutlet weak var playAgainState_bttn: UIButton!
    @IBOutlet weak var home_bttn: UIButton!
    
    //this is the timer that will be used to count how long it takes them to count how long the user takes to turn off all the switches
    var timer = Timer()

    //this is the starting time that is 0
    var time = 0

    //This var inherits the TwoPlayerGame class that will be used to access the sorting func. Although it is named for the two player game, when coding one player i realized I could use it for one player as well
    var game = TwoPlayerGame()
    
    //a bool array that will resemble the switches collection state
    var switchArr = [Bool] (repeating: true, count: 60)
    
    
    //when the pause button is pressed the pause func will run
    @IBAction func pauseButton_bttn(_ sender: UIButton) {
        pause()
    }
    
    @IBAction func resume_bttn(_ sender: UIButton) {
        resume()
    }
    
    @IBAction func playAgain_bttn(_ sender: UIButton) {
        playAgain()
    }
    
    
    @IBOutlet var switchesArr_switches: [UISwitch]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this starts the timers
        timers()
        
        //as seen before
        let vc = navigationController as! NavigationControllerInClass
        gameInfo = vc.gameInfo
        
        //this disables the user from tampering with the "You turned off all the switches in:" label
        secondsIn_lbl.isUserInteractionEnabled = false
        
        //set all switches to default color
        setColour()
        
        //this sets all the switches to off
        turnOff()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //this function starts the timer used to count the time it takes the user to turn off all the switches
    func timers(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
    }
    
    
    //this is the action the timer performs when a second goes by. It increases the time, updates the label and checks for all switches
    @objc func action(){
        time += 1
        time_lbl.text! = "\(time)"
        gameDone()
    }

    
    //this function will check to see if all switches are off
    func gameDone() {
        //this syncs up the bool array that models the switches collection
        for i in 0...switchesArr_switches.count - 1{
            if (switchesArr_switches[i].isOn){
                switchArr[i] = true
            }else{
                switchArr[i] = false
            }
        }
        
        //this sets the bool array to a sorted bool array with all the trues first and falses last
        switchArr = game.InsertionSorted(unsortedArray: switchArr)
        
        //if the 57th item in the array is false then the game is done and the timer stops and the winning screen is displayed
        if (switchArr[57] == true){
            timer.invalidate()
            winningScreen()
        }

    }
    
   
    //this will display the winning screen and output the time that the user took to turn off all the switches
    func winningScreen(){
        puaseView_view.isHidden = false
        secondsIn_lbl.isHidden = false
        timeDone_lbl.text = "\(time) seconds"
        timeDone_lbl.isHidden = false
        playAgainState_bttn.isHidden = false
        home_bttn.isHidden = false
    }

    //this will set all the switches to the default color
    func setColour(){
        for i in 0...switchesArr_switches.count - 1{
            switchesArr_switches[i].onTintColor = gameInfo.switchColor
        }
    }
    
    
    //when the player presses the pause button the pause screen will not be hidden and the timer will be paused
    func pause(){
        puaseView_view.isHidden = false
        resumeState_bttn.isHidden = false
        goHomeState_bttn.isHidden = false
        timer.invalidate()
    }
    
    //when the resume button is pressed the timer will start again and the pause page will be hidden
    func resume(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        puaseView_view.isHidden = true
        resumeState_bttn.isHidden = true
        goHomeState_bttn.isHidden = true
    }
    
    
    //when the player hits paly again it sets all the switches to off and sets the time to 0 and starts the timer and hides the winning screen
    func playAgain(){
        turnOff()
        time = 0
        time_lbl.text = "\(time)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        puaseView_view.isHidden = true
        secondsIn_lbl.isHidden = true
        timeDone_lbl.isHidden = true
        playAgainState_bttn.isHidden = true
        home_bttn.isHidden = true
    }
    
    func turnOff(){
        for i in 0...switchesArr_switches.count - 1{
            switchesArr_switches[i].isOn = false
        }
    }
}
