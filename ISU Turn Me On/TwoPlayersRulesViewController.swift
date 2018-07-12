//
//  TwoPlayersRulesViewController.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-12.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class TwoPlayersRulesViewController: UIViewController, UITextFieldDelegate {
    
    //Two Players Rule View
    var gameInfo = GameInfo()//var to allow access into the GameInfo Class
    //the text fields that people can enter their names with
    @IBOutlet weak var playerOne_tf: UITextField!
    @IBOutlet weak var playerTwo_tf: UITextField!
    //the text views with the rules for disabling editing feature
    @IBOutlet weak var text1_tv: UITextView!
    @IBOutlet weak var text2_tv: UITextView!
    @IBOutlet weak var text3_tv: UITextView!
    @IBOutlet weak var text4_tv: UITextView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the tf delegates
        playerOne_tf.delegate = self
        playerTwo_tf.delegate = self
        
        //disable the feat that allows people to edit textviews
        text1_tv.isUserInteractionEnabled = false
        text2_tv.isUserInteractionEnabled = false
        text3_tv.isUserInteractionEnabled = false
        text4_tv.isUserInteractionEnabled = false
        
        //allow changes to be made to the global class
        let vc = navigationController as! NavigationControllerInClass
        gameInfo = vc.gameInfo
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //make the keyboard go away when enter is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {//make the keyboard go away when return is pressed
        textField.resignFirstResponder()
        return true
    }
    
    //a segue to pass the user names to next board
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue1" {
            
            if let destViewController = segue.destination as? TwoPlayerGameViewController{
                destViewController.playerOneText = playerOne_tf.text!
                destViewController.playerTwoText = playerTwo_tf.text!
            }
        }

    }
    
    
    
}
