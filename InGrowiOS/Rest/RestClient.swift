//
//  RestClient.swift
//  InGrowiOS
//
//  Created by Meikiem on 2/1/21.
//

import Foundation
import Alamofire

class RestClient{
    static private let baseUrl = "https://event.ingrow.co/v1"
    
    class func sendEvents(json: NSString, apiKey:String){
        
        let url =  NSURL(string:baseUrl as String)
        var request = URLRequest(url: url! as URL)
        
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField:Const.API_KEY)
        request.setValue("no-cache", forHTTPHeaderField:"Cache-Control")
        request.httpBody = json.data(using: String.Encoding.utf8.rawValue);
        
        AF.request(request as URLRequestConvertible).response { (response) in
            print(response.response?.statusCode as Any)
            if(response.response?.statusCode == Const.SUCCESSFUL){
                print("Success - SEND EVENTS SUCCEEDED")
            } else {
                print("Error - ERROR SENDING EVENTS")
            }
        }
        
    }
}
