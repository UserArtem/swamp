//
//  InvocationSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 01/09/2016.
//
//

import Foundation

// [INVOCATION, requestId|number, registration|number, details|dict, args|array?, kwargs|dict?]
class InvocationSwampMessage: SwampMessage {
    
    let requestId: UInt64
    let registration: UInt64
    let details: [String: AnyObject]
    
    let args: [AnyObject]?
    let kwargs: [String: AnyObject]?
    
    init(requestId: UInt64, registration: UInt64, details: [String: AnyObject], args: [AnyObject]?=nil, kwargs: [String: AnyObject]?=nil) {
        self.requestId = requestId
        self.registration = registration
        self.details = details
        
        self.args = args
        self.kwargs = kwargs
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.requestId = payload[0] as! UInt64
        self.registration = payload[1] as! UInt64
        self.details = payload[2] as! [String: AnyObject]
        self.args = payload[safe: 3] as? [AnyObject]
        self.kwargs = payload[safe: 4] as? [String: AnyObject]
    }
    
    func marshal() -> [Any] {
        var marshalled: [Any] = [SwampMessages.invocation.rawValue, self.requestId, self.registration, self.details]
        
        if let args = self.args {
            marshalled.append(args)
            if let kwargs = self.kwargs {
                marshalled.append(kwargs)
            }
        } else {
            if let kwargs = self.kwargs {
                marshalled.append([])
                marshalled.append(kwargs)
            }
        }
        
        return marshalled
    }
}
