//
//  ViewController.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-11.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Homepage

    var gameInfo = GameInfo()//this var inherits all the global vars in the GameInfo Class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //allow the viewcontroller to modify the global variables
        let vc = navigationController as! NavigationControllerInClass
        gameInfo = vc.gameInfo
        
        //load the sounds
        gameInfo.loadSound()
        
        //set the color of the switch to the default color

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

