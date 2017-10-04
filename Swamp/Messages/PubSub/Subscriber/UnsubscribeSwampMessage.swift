//
//  UnsubscribeSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 24/08/2016.
//
//

import Foundation

/// [UNSUBSCRIBE, requestId|number, subscription|number]
class UnsubscribeSwampMessage: SwampMessage {
    
    let requestId: UInt64
    let subscription: UInt64
    
    init(requestId: UInt64, subscription: UInt64) {
        self.requestId = requestId
        self.subscription = subscription
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.requestId = payload[0] as! UInt64
        self.subscription = payload[1] as! UInt64
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.unsubscribe.rawValue, self.requestId, self.subscription]
    }
}
