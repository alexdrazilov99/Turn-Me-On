//
//  TwoPlayerGame.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-12.
//  Copyright © 2017 Alex. All rights reserved.
//

import Foundation

class TwoPlayerGame{

    func InsertionSorted (unsortedArray: [Bool]) -> [Bool]{//this function takes in an integer array and returns an integer array
        var array = unsortedArray//let the variable array equal the array that was passed in through the parameters
        for i in 1...array.count - 1{//for every item in the array except the first variable, the for loop will run through it
            let element = array[i]//let the element variable equal the number we are at in the array
            var j = i//set the variable j to i, so the number we are at in our for loop
            while (j > 0 && array[j-1] != element){//while j is greater than 0 and the array position we are at before is greater that the element
                array[j] = array[j-1]//set the array at j to the value before it in the array
                j = j - 1//set j to one value less so we can repeat this
                array[j] = element//set the array number at j to the element we are working wth
            }
        }
        return array//return our new and nicely sorted array
    }
    
    
    //this function will see what is the middle value since the array will be sorted
    func winner(array: [Bool]) -> Int{
        if (array[27] == true){//if mid is true return one
            return 1
        }
        return 0//else return 0
    }
    
}
