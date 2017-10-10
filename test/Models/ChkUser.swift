//
//  ChkUser.swift
//  test
//
//  Created by Володимир on 10/10/17.
//  Copyright © 2017 Володимир. All rights reserved.
//

import Foundation
import Alamofire

class ChkUser {
    
    static let instance = ChkUser()
    var responseString = ""
    var cookieString = ""
    
    private init(){
    }
    
    func getUser(withName loginName: String, withPassword pass:String) -> Bool {
        
        Alamofire.request("http://vps9615.hyperhost.name/login/index", method: .post, parameters: ["username":"\(loginName)", "password":"\(pass)"], encoding: JSONEncoding.default, headers: ["Content-Type":"application/json", "Charset":"UTF-8"])
            .responseJSON { response in
                let responsValueJson = response.result.value as! [String:AnyObject]
                print(responsValueJson)
                for key in responsValueJson.keys{
                    guard let value4Key = responsValueJson[key] else {return}
                    self.responseString = String(describing: value4Key)
                }
                let responseJson = response.response
                let cookieRecord = responseJson?.allHeaderFields["Set-Cookie"]
                guard let cookieRecordStr = cookieRecord else {return}
                guard let cookieStringField = String(describing: cookieRecordStr).split(separator: ";").first else { return }
                guard let cookieStringValue = cookieStringField.split(separator: "=").last else { return }
                self.cookieString = String(cookieStringValue)
        }
        sleep(5)
        return responseString == loginName
    }
}
