//
//  TwoPlayerGameViewController.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-12.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class TwoPlayerGameViewController: UIViewController{
    
    
    //outlets people see
    @IBOutlet weak var time_lbl: UILabel!
    @IBOutlet weak var playerOne_lbl: UILabel!
    @IBOutlet weak var playerTwo_lbl: UILabel!
    @IBOutlet weak var advantage_lbl: UILabel!
    @IBOutlet weak var resumeBttn_bttn: UIButton!
    @IBOutlet weak var goHome_bttn: UIButton!
    @IBOutlet weak var pausePage_view: UIView!
    @IBOutlet weak var winnerState_lbl: UILabel!
    @IBOutlet weak var playerState_lbl: UILabel!
    @IBOutlet weak var playAgainState_bttn: UIButton!
    @IBOutlet weak var homeState_bttn: UIButton!
    
    //vars for the segue to pass their names
    var playerOneText = String()
    var playerTwoText = String()
    
    //a var that lets us access the global vars
    var gameInfo = GameInfo()
    
    //the play again
    @IBAction func playAgain_bttn(_ sender: UIButton) {
        playAgain()
    }
    
    
    @IBAction func pause_bttn(_ sender: UIButton) {
        pause()
        
    }
    @IBAction func resume_bttn(_ sender: UIButton) {
        resume()
    }

    
    //switches collection

    @IBOutlet var switchesArray_switches: [UISwitch]!
    

    // a bool array that will coordinate with the switches
    var switchArr = [Bool] (repeating: true, count: 55)
    
    //set the initial time to be 20 seconds since we are counting down
    var time = 20
    //these are our two timers (thirty seconds is now twenty seconds)
    var timer = Timer()
    var thirtyTimer = Timer()
    
    //A variable that will be calling the TwoPlayerGame class to sort the switches
    let sortSwitches = TwoPlayerGame()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //allows us to maniuplate the global vars
        let vc = navigationController as! NavigationControllerInClass
        gameInfo = vc.gameInfo
        
        //call the necessary classes to set up the game
        setUp()
        setNames()
        setColour()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this is the set up of the board. It sets a variable of the class GameBoard and tehn it will switch all the switches on or off according to the bool array. It will also display the advantage to the user and it will set the timers.
    func setUp(){
        let game = GameBoard(switchesArr: switchArr, advLabel: advantage_lbl.text!)
        game.StateStartSet()
        for i in 0...game.switchesArr.count - 1{
            if (game.switchesArr[i] == false){
                switchesArray_swtch[i].setOn(false, animated: false)
            }else{
                switchesArray_swtch[i].setOn(true, animated: false)
            }
        }
        advantage_lbl.text! = game.advLabel
        timers()
        
    }
    
    //this will initialize the timers at the start of their time
    func timers(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        thirtyTimer = Timer.scheduledTimer(timeInterval: 21, target: self, selector: #selector(thirtyAction), userInfo: nil, repeats: false)
    }
    
    //this is the action of the seconds timer. It increases the time counted each time and displays it to the time label.
    @objc func action(){
        time -= 1
        time_lbl.text! = "\(time)"
    }
    
    //this is the action of the 30 seconds timer (it is now 20 seconds though). It stops the seconds timer when called, stops itself, sets the text to 0 and will show the end page
    @objc func thirtyAction(){
        time_lbl.text! = "0"
        timer.invalidate()
        thirtyTimer.invalidate()
        showEndPage()
    }
    
    
    //this function will sort the switches array of bool values
    func sortSwitchesFunc()
    {
        for i in 0...switchArr.count - 1{
            if (switchesArray_swtch[i].isOn == true){
                switchArr[i] = true
            }
            else{
                switchArr[i] = false
            }
        }
        switchArr = sortSwitches.InsertionSorted(unsortedArray: switchArr)
    }
    
    //this decides what to display as the winner at the end
    func winnerWinner (){
        if (sortSwitches.winner(array: switchArr) == 1 && playerOneText == ""){
            playerState_lbl.text! = ("Player 1")
        }else if (sortSwitches.winner(array: switchArr) == 1 && playerOneText != ""){
            playerState_lbl.text! = ("\(playerOneText)")
        }
        if (sortSwitches.winner(array: switchArr) == 0 && playerTwoText == ""){
            playerState_lbl.text! = ("Player 2")
        }else if (sortSwitches.winner(array: switchArr) == 0 && playerOneText != ""){
            playerState_lbl.text! = ("\(playerTwoText)")
        }
    }   
    
    //this will show then end page when called
    func showEndPage(){
        sortSwitchesFunc()
        winnerWinner()
        pausePage_view.isHidden = false
        winnerState_lbl.isHidden = false
        playerState_lbl.isHidden = false
        playAgainState_bttn.isHidden = false
        homeState_bttn.isHidden = false
    }
    
    //this will hide the end page when called
    func hideEndPage(){
        pausePage_view.isHidden = true
        winnerState_lbl.isHidden = true
        playerState_lbl.isHidden = true
        playAgainState_bttn.isHidden = true
        homeState_bttn.isHidden = true
    }
    
    //this will show the pause page when called
    func showPausePage(){
        pausePage_view.isHidden = false
        resumeBttn_bttn.isHidden = false
        goHome_bttn.isHidden = false
    }
    
    //this will hide the pause page when called
    func hidePausePage(){
        pausePage_view.isHidden = true
        resumeBttn_bttn.isHidden = true
        goHome_bttn.isHidden = true
    }
    
    //set the users names to the text from the segue if they are less than 15 characters and are not nil
    func setNames(){
        if (playerTwoText != "" && playerTwoText.characters.count < 15){
            playerTwo_lbl.text = "\(playerTwoText):"
        }
        if (playerOneText != "" && playerOneText.characters.count < 15){
            playerOne_lbl.text = "\(playerOneText):"
        }
    }
    
    //when the pause button is pressed the pause page comes up and timers are stopped
    func pause(){
        showPausePage()
        timer.invalidate()
        thirtyTimer.invalidate()
    }
    
    //when the user wants to resume the game the timers continue and the pause pages go away
    func resume(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        thirtyTimer = Timer.scheduledTimer(timeInterval: TimeInterval(time), target: self, selector: #selector(thirtyAction), userInfo: nil, repeats: false)
        hidePausePage()
    }
    
    //a func that will set the board for a new game
    func playAgain(){
        time = 20
        hideEndPage()
        setUp()
        time_lbl.text! = "30"

    }
    
    //this func will go through all the switches and set them to the color of the color in our global class
    func setColour(){
        for i in 0...switchesArray_swtch.count - 1{
            switchesArray_swtch[i].onTintColor = gameInfo.switchColor
        }
    }

}

