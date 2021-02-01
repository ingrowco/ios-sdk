//
//  InGrowProject.swift
//  InGrowiOS
//
//  Created by Meikiem on 2/1/21.
//

import Foundation

struct InGrowProject {
    
    let apiKey: String
    let project: String
    let stream: String
    let isLoggingEnable: Bool
    var anonymousId: String = ""
    var userId: String = ""
    
    init(apiKey: String, project: String, stream: String, isLoggingEnable: Bool) {
        
        if(apiKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            fatalError("Api key should not be empty.")
        }
        
        if(project.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            fatalError("Project object should not be empty.")
        }
        
        if(stream.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            fatalError("Stream must be non-null and non-empty.")
        }
        self.project   = project
        self.stream = stream
        self.apiKey  = apiKey
        self.isLoggingEnable  = isLoggingEnable
    }
    
    init(apiKey: String, project: String, stream: String, isLoggingEnable: Bool, anonymousId: String, userId: String?) {
        
        if(apiKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            fatalError("Error - apiKey should not be empty.")
        }
        
        if(project.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            fatalError("Error - project object should not be empty.")
        }
        
        if(stream.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            fatalError("Error - stream must be non-null and non-empty.")
        }
        if(anonymousId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            fatalError("Error - anonymousId should not be empty.")
        }
        self.project   = project
        self.stream = stream
        self.apiKey  = apiKey
        self.isLoggingEnable  = isLoggingEnable
        self.anonymousId  = anonymousId
        if(userId != nil){
            self.userId  = userId!
        }
    }
}

