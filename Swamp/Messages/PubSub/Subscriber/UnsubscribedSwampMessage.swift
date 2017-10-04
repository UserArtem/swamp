//
//  UnsubscribedSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 24/08/2016.
//
//

import Foundation

/// [UNSUBSCRIBED, requestId|number]
class UnsubscribedSwampMessage: SwampMessage {
    
    let requestId: UInt64
    
    init(requestId: UInt64) {
        self.requestId = requestId
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.requestId = payload[0] as! UInt64
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.unsubscribed.rawValue, self.requestId]
    }
}
