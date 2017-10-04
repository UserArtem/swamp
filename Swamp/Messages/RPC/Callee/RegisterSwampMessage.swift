//
//  RegisterSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 01/09/2016.
//
//

import Foundation

/// [Register, requestId|number, options|dict, proc|string]
class RegisterSwampMessage: SwampMessage {
    
    let requestId: UInt64
    let options: [String: AnyObject]
    let proc: String
    
    init(requestId: UInt64, options: [String: AnyObject], proc: String) {
        self.requestId = requestId
        self.options = options
        self.proc = proc
    }
    
    // MARK: SwampMessage protocol
    required init(payload: [Any]) {
        self.requestId = payload[0] as! UInt64
        self.options = payload[1] as! [String: AnyObject]
        self.proc = payload[2] as! String
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.register.rawValue, self.requestId, self.options, self.proc]
    }
}
