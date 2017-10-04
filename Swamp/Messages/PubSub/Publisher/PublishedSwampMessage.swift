//
//  PublishedSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 01/09/2016.
//
//

import Foundation

/// [PUBLISHED, requestId|number, options|dict, topic|String, args|list?, kwargs|dict?]
class PublishedSwampMessage: SwampMessage {
    
    let requestId: UInt64
    let publication: UInt64
    
    init(requestId: UInt64, publication: UInt64) {
        self.requestId = requestId
        self.publication = publication
    }
    
    // MARK: SwampMessage protocol
    required init(payload: [Any]) {
        self.requestId = payload[0] as! UInt64
        self.publication = payload[1] as! UInt64
    }
    
    func marshal() -> [Any] {
        let marshalled: [Any] = [SwampMessages.published.rawValue, self.requestId, self.publication]
        return marshalled
    }
}
