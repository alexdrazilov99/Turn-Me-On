//
//  ChangeColourViewController.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-12.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class ChangeColourViewController: UIViewController {
    
//    //Change Colour View Controller
//    
//    //as seen before
//    var gameInfo = GameInfo()
//
//    //switch that will be changing colors
//    @IBOutlet weak var colourSwitch_swtch: UISwitch!
//    
//    //slider outlets that will check the sliders values
//    @IBOutlet weak var redSlider_sldr: UISlider!
//    @IBOutlet weak var blueSlider_sldr: UISlider!
//    @IBOutlet weak var greenSlider_sldr: UISlider!
//    
//    //slider actions that will update the switch color to whenever the sliders are changed
//    @IBAction func redValChanged_sldr(_ sender: UISlider) {
//        colourSwitch_swtch.onTintColor = updateColor()
//    }
//    @IBAction func blueValChanged_sldr(_ sender: UISlider) {
//        colourSwitch_swtch.onTintColor = updateColor()
//    }
//    @IBAction func greenValChanged_sldr(_ sender: UISlider) {
//        colourSwitch_swtch.onTintColor = updateColor()
//    }
//    
//    //the switch states to see if they are on or off
//    @IBOutlet weak var redSwitch: UISwitch!
//    @IBOutlet weak var blueSwitch: UISwitch!
//    @IBOutlet weak var greenSwitch: UISwitch!
//    
//    //when the switches are toggled the switch color will update
//    @IBAction func redSwitchValChanged(_ sender: UISwitch) {
//        colourSwitch_swtch.onTintColor = updateColor()
//    }
//    @IBAction func blueSwitchValChanged(_ sender: UISwitch) {
//        colourSwitch_swtch.onTintColor = updateColor()
//    }
//    @IBAction func greenSwitchValChanged(_ sender: UISwitch) {
//        colourSwitch_swtch.onTintColor = updateColor()
//    }
//    
//    //when the reset button is pressed then set the sliders to max and the switch color to the default green and the global var will be set to the same green
//    @IBAction func reset_bttn(_ sender: UIButton) {
//        colourSwitch_swtch.onTintColor = UIColor(red: 0.0, green: 0.847457647323608, blue: 0.29237288236618, alpha: 1)
//        gameInfo.changeColor(switchC: UIColor(red: 0.0, green: 0.847457647323608, blue: 0.29237288236618, alpha: 1))
//        greenSlider_sldr.value = 1
//        redSlider_sldr.value = 1
//        blueSlider_sldr.value = 1
//    }
//    
//    
//    //when the set button is pressed the global color var will be set to the current color
//    @IBAction func setButton_bttn(_ sender: UIButton) {
//        gameInfo.switchColor = updateColor()
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //as seen before
//        let vc = navigationController as! NavigationControllerInClass
//        gameInfo = vc.gameInfo
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    
//    //this fucntion will update the color
//    func updateColor() -> UIColor{
//        //set the red blue and green values to 0 to start
//        var red: CGFloat = 0
//        var green: CGFloat = 0
//        var blue: CGFloat = 0
//        
//        //if the cooresponding switch is on then make the cooresonding value equal the slider values for that color
//        if redSwitch.isOn {
//            red = CGFloat(redSlider_sldr.value)
//        }
//        if greenSwitch.isOn {
//            green = CGFloat(greenSlider_sldr.value)
//        }
//        if blueSwitch.isOn {
//            blue = CGFloat(blueSlider_sldr.value)
//        }
//        
//        //let the color constant equal the combination of all the colors
//        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
//        
//        //return the color combination
//        return color
//    }
}
