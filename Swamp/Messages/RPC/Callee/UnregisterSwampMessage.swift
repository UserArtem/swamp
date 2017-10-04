//
//  UnregisterSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 01/09/2016.
//
//

import Foundation

/// [UNREGISTER, requestId|number, registration|number]
class UnregisterSwampMessage: SwampMessage {
    
    let requestId: UInt64
    let registration: UInt64
    
    init(requestId: UInt64, registration: UInt64) {
        self.requestId = requestId
        self.registration = registration
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.requestId = payload[0] as! UInt64
        self.registration = payload[1] as! UInt64
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.unregister.rawValue, self.requestId, self.registration]
    }
}
