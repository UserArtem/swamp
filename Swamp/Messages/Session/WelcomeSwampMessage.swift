//
//  WelcomeMessage.swift
//  swamp
//
//  Created by Yossi Abraham on 18/08/2016.
//  Copyright © 2016 Yossi Abraham. All rights reserved.
//

import Foundation
import SwiftyJSON

/// [WELCOME, sessionId|number, details|Dict]
class WelcomeSwampMessage: SwampMessage {
    
    let sessionId: UInt64
    let details: [String: AnyObject]
    
    init(sessionId: UInt64, details: [String: AnyObject]) {
        self.sessionId = sessionId
        self.details = details
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.sessionId = payload[0] as! UInt64
        self.details = payload[1] as! [String: AnyObject]
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.welcome.rawValue, self.sessionId, self.details]
    }
}
