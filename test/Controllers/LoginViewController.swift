//
//  LoginViewController.swift
//  test
//
//  Created by Володимир on 10/10/17.
//  Copyright © 2017 Володимир. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let checkUser = ChkUser.instance
    var responsLogin: String = ""
    var cookieLogin: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        guard let loginName = login.text else {
            login.placeholder = "!!! Enter login !!!"
            return
        }
        guard let pass = password.text else {
            showWarningMsg("Password can't be empty!")
            return
        }
        checkUser.getUser(loginName: loginName, pass: pass, completion: {( loginResponse, cookieResponse) in
            if cookieResponse == "" {
                self.showWarningMsg(loginResponse)
            } else {
                self.performSegue(withIdentifier: "granted", sender: (loginResponse, cookieResponse))
            }
        })
        
    }
        private func showWarningMsg(_ textMsg: String) {
            let alert = UIAlertController(title: "Warning!", message: textMsg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
  
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainVC = segue.destination as! ViewController
        let userData = sender as? (login: String, cookie: String)
        mainVC.userData = userData
    }
}
