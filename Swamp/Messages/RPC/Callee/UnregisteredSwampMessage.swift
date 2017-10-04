//
//  UnregisteredSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 01/09/2016.
//
//

import Foundation

/// [UNREGISTERED, requestId|number]
class UnregisteredSwampMessage: SwampMessage {
    
    let requestId: UInt64
    
    init(requestId: UInt64) {
        self.requestId = requestId
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.requestId = payload[0] as! UInt64
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.unregistered.rawValue, self.requestId]
    }
}
