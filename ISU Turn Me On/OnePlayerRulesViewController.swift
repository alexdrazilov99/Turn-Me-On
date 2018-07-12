//
//  OnePlayerRulesViewController.swift
//  ISU Turn Me On
//
//  Created by Student on 2017-01-12.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class OnePlayerRulesViewController: UIViewController {

    //this outlet allows me to disable the user control of the view
    @IBOutlet weak var rules_tv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //disable the user control of the view
        rules_tv.isUserInteractionEnabled = false
        print("View did load")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
