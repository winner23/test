//
//  ViewController.swift
//  test
//
//  Created by Володимир on 10/9/17.
//  Copyright © 2017 Володимир. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userData: (login:String,cookie:String)?
    
    @IBOutlet weak var user: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        user.text = "User: \(userData?.login)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

