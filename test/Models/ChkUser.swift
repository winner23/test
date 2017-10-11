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
    let urlForLogin = "http://vps9615.hyperhost.name/login/index"
    let headres = ["Content-Type":"application/json", "Charset":"UTF-8"]
    private init(){
    }
    
    func getUser(loginName: String, pass: String, completion: @escaping (_ respons: String, _ cookieSession: String) ->()) {
        
        Alamofire.request(urlForLogin, method: .post, parameters: ["username":"\(loginName)", "password":"\(pass)"], encoding: JSONEncoding.default, headers: headres)
            .responseJSON { response in
                
                switch(response.result){
                case .success(_):
                    var responseAsLoginName: String = ""
                    if let responsValueJson = response.result.value as! [String:AnyObject]! {
                        //print(responsValueJson)
                        for key in responsValueJson.keys{
                            guard let value4Key = responsValueJson[key] else {return}
                            responseAsLoginName = String(describing: value4Key)
                        }
                    }
                    if responseAsLoginName != loginName {
                        completion(responseAsLoginName, "")
                    } else {
                        let responseJson = response.response
                        guard let cookieRecord = responseJson?.allHeaderFields["Set-Cookie"]! else {return}
                        let cookieRecordStr = cookieRecord as! String
                        let cookieStringField = String(describing: cookieRecordStr.split(separator: ";").first)
                        guard let cookieStringValue = cookieStringField.split(separator: "=").last else { return }
                        completion(responseAsLoginName, String(cookieStringValue))
                    }
                    
                case .failure(_):
                    completion("Error", "")
                }
        }
    }
}
