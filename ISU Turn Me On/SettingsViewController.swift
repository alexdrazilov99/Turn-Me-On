//
//  SettingsViewController.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-12.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //Settings View Controller
    
    //this will track the state of the sound switch
    @IBOutlet weak var soundState_switch: UISwitch!

    
    //when the sound switch is toggled it will check to see if it is on or off
    @IBAction func sound_bttn(_ sender: UISwitch) {
        //if the sound button is off then set the global var to false so the music will not play
        if (soundState_switch.isOn == false){
            gameInfo.musicOn = false
            gameInfo.loadSound()
        }else{
            //if the switch is on the play the music and change the global var
            gameInfo.musicOn = true
            gameInfo.loadSound()
        }
    }

    //as seen before
    var gameInfo = GameInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //as seen before
        let vc = navigationController as! NavigationControllerInClass
        gameInfo = vc.gameInfo
        
        //set the sound switch to the default color
        soundState_switch.onTintColor = gameInfo.switchColor
        
        //if the music is not playing set the soudn switch to off
        if(gameInfo.musicOn == false){
            soundState_switch.isOn = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
