//
//  GameBoard.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-13.
//  Copyright © 2017 Alex. All rights reserved.
//

import Foundation

class GameBoard{
    
    //this function will set the gameboard of the two player game
    
    //it needs a bool array to mimic the switches and a label to mimic the screen
    var switchesArr : [Bool]
    var advLabel: String
    
    //initialize those values
    init (switchesArr: [Bool], advLabel: String){
        self.switchesArr = switchesArr
        self.advLabel = advLabel
    }
    
    
    //the function will set the values of what should be on to true and ones the should be off to false
    func StateStartSet (){
        
        //the the contstant adv equal either one or two at random
        let adv = (Int(arc4random_uniform(2)))
        
        //a for loop that will go through the whole array to set the first half as true/on and second as false/off
        for i in 0...54{
            if (i <= 25 || i == 29){
                switchesArr[i] = true
            }
            else{
                switchesArr[i] = false
            }
        }
        
        //if the advantage is 1 then set the middle switch to ture/on and either way display the advantage
        if (adv == 1){
            switchesArr[27] = true
            advLabel = "Advantage: Player 1"
        }
        else{
            advLabel = "Advantage: Player 2"
        }
    }
}

