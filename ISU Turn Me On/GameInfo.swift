//
//  GameInfo.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-19.
//  Copyright © 2017 Alex. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class GameInfo{
    
    //this is the color that all the switches will be set to by default
    var switchColor = UIColor(red: 0.0, green: 0.847457647323608, blue: 0.29237288236618, alpha: 1)
    
    //this is the url of the song I want my app to play
    var url = NSURL(fileURLWithPath: Bundle.main.path(forResource: "We Press On ", ofType: "mp3")!)
    //the is the variable for the audioPlayer that will be played
    var audioPlayer = AVAudioPlayer()
    //this variable will track if they want the sound to be on or off
    var musicOn = true
    
    //the function will be called when we want to play the song
    func loadSound(){
        //this is a throw and catch for playing the music
        do{
            try audioPlayer = AVAudioPlayer(contentsOf: url as URL)//try making the audio player play my song I inserted
        }catch{
            //run this code if you have an error but there is no code
        }
        //if the player does not have the turn off music switch turned off
        if (musicOn){
        audioPlayer.play()//play the beats
        }
    }
    
    //this func will change the default color to whatever the user sets the color to
    func changeColor (switchC: UIColor){
        switchColor = switchC
    }
    
}
