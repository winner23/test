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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let (responseString, cookieString) = checkUser.getUser(withName: loginName, withPassword: pass)
        
        if responseString != loginName {
            self.showWarningMsg(responseString)
        } else {
            self.performSegue(withIdentifier: "granted", sender: cookieString)
        }
    }
        private func showWarningMsg(_ textMsg: String) {
            let alert = UIAlertController(title: "Warning!", message: textMsg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    //                Alamofire.request("http://vps9615.hyperhost.name/subject/insertData", method: .post, parameters: ["subject_name":"iOS Development with Swift 4", "subject_description":"just for testing from XCode"], encoding: JSONEncoding.default, headers: ["Content-Type":"application/json", "Charset":"UTF-8"])
    //                    .responseJSON { response in
    //                        print(response.request as Any)  // original URL request
    //                        print(response.response as Any) // URL response
    //                        print(response.result.value as Any)
    //                }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
