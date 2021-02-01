//
//  InGrowClient.swift
//  InGrowiOS
//
//  Created by Meikiem on 2/1/21.
//

import Foundation
import Network
import Alamofire

public final class InGrowClient {
    
    static let shared = InGrowClient()
    var inGrowProject: InGrowProject
    private var isDebugMode:Bool
    private var inGrowSession: InGrowSession?
    
    struct Config {
        var inGrowProject: InGrowProject
    }
    private static var config:Config?
    
    class func setup(_ config:Config){
        InGrowClient.config = config
    }
    
    init(){
        guard let config = InGrowClient.config else {
            fatalError("Error - you must call setup before accessing InGrowClient.shared")
        }
        inGrowProject = config.inGrowProject
        isDebugMode = false
    }
    
    public func setDebugMode(isDebugMode:Bool){
        self.isDebugMode = isDebugMode
    }
    
    public static func client() -> InGrowClient{
        return shared
    }
    
    static func enrichmentBySession(inGrowSession: InGrowSession) {
        guard InGrowClient.config != nil else {
            fatalError("Error - you must call setup before requesting enrichmentBySession")
        }
        shared.inGrowSession = inGrowSession
    }
    
    public func logEvents(events: Dictionary<String, Any>) {
        
        if(events.isEmpty){
            fatalError("Error - events must not be null.")
        }
        var main = Dictionary<String, Any>()
        var inGrowObject = Dictionary<String, Any>()
        var eventObject = Dictionary<String, Any>()
        var enrichmentObject = Dictionary<String, Any>()
        var enrichmentArray = [[String: Any]]()
        var inputObject = Dictionary<String, Any>()
        
        inGrowObject.updateValue(self.inGrowProject.project, forKey: Const.PROJECT)
        inGrowObject.updateValue(self.inGrowProject.stream, forKey: Const.STREAM)
        for (key, value) in events {
            eventObject.updateValue(value, forKey: key)
        }
        if(!self.inGrowProject.anonymousId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            inputObject.updateValue(self.inGrowProject.anonymousId, forKey: Const.ANONYMOUS_ID)
            if(self.inGrowSession != nil && !self.inGrowSession!.userId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
                inputObject.updateValue(self.inGrowSession!.userId, forKey: Const.USER_ID)
            } else {
                inputObject.updateValue(self.inGrowProject.userId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "" : self.inGrowProject.userId, forKey: Const.USER_ID)
            }
            enrichmentObject.updateValue(Const.SESSION, forKey: Const.NAME)
            enrichmentObject.updateValue(inputObject, forKey: Const.INPUT)
            enrichmentArray.append(enrichmentObject as [String: Any])
            main.updateValue(enrichmentArray, forKey: Const.ENRICHMENT)
        }
        main.updateValue(inGrowObject, forKey: Const.INGROW)
        main.updateValue(eventObject, forKey: Const.EVENT)
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: main, options: .prettyPrinted)
            let requestString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) ?? ""
            if(!requestString.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
                sendRequest(request: requestString)
            }else{
                fatalError("Error - JSON request must not be null!")
            }
        } catch {
            print("Error - Not a valid JSON")
        }
    }
    
    private func sendRequest(request: NSString){

        RestClient.sendEvents(json: request, apiKey: self.inGrowProject.apiKey)
    }
}

