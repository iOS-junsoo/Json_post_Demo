//
//  Request.swift
//  Json_post_Demo
//
//  Created by 준수김 on 2021/10/20.
//

import Foundation
import Alamofire

class Request {
    
    func postData() {
        let url = "https://ptsv2.com/t/ist5e-1634718689/post"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["id":"dkssud123", "pw":"wkfrk123"] as Dictionary
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("POST 성공")
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
    }
    
}
