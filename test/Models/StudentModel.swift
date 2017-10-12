//
//  StudentModel.swift
//  test
//
//  Created by Володимир on 10/12/17.
//  Copyright © 2017 Володимир. All rights reserved.
//

import Foundation
import Alamofire

class StudentModel {
    
    static func getStudents(urlForGetStudents:String, sessionID: String, completion: @escaping (_ count: Int, _ values: [String:AnyObject])->()){
        let headres = ["Content-Type":"application/json", "Charset":"UTF-8", "Set-Cookie":sessionID]
        
//        Alamofire.request(urlForGetStudents, method: .get, parameters: [], encoding: JSONEncoding.default, headers: headres)
//            .responseJSON { response in
//                
//                switch(response.result){
//                case .success(_):
//                    print()
//                case .failure(_):
//                    print()
//                }
//        }
    }
}
