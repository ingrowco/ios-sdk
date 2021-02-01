//
//  InGrowSession.swift
//  InGrowiOS
//
//  Created by Meikiem on 2/1/21.
//

import Foundation

struct InGrowSession {
    
    let userId:String
    
    init(userId: String) {
        
        if(userId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            fatalError("Error - anonymousId should not be empty.")
        }
        self.userId = userId
    }
}
