//
//  InGrowLogging.swift
//  InGrowiOS
//
//  Created by Meikiem on 2/1/21.
//

import Foundation
import OSLog

public class InGrowLogging{
    
    private static var osLog: OSLog = {
        OSLog.disabled
    }()
    
    private static var osLogType: OSLogType = {
        OSLogType.debug
    }()
    
    public static func log(msg:String){
        if(isLoggingEnabled()){
            os_log("%@", log: osLog, type: .debug, msg)
        }
    }
    
    public static func disableLogging(){
        osLog = .disabled
    }
    
    public static func enableLogging(){
        osLog = OSLog(subsystem: "co.ingrow.ios", category: "EventOperations")
    }
    
    public static func isLoggingEnabled() -> Bool {
        return osLog.isEnabled(type: OSLogType.debug)
    }
}
