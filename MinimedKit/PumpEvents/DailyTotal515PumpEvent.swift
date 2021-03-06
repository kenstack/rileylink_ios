//
//  DailyTotal515PumpEvent.swift
//  RileyLink
//
//  Created by Pete Schwamb on 9/8/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import Foundation

public struct DailyTotal515PumpEvent: PumpEvent {
    public let length: Int
    public let rawData: Data
    public let timestamp: DateComponents
    
    public init?(availableData: Data, pumpModel: PumpModel) {
        length = 38
        
        guard length <= availableData.count else {
            return nil
        }
        
        rawData = availableData.subdata(in: 0..<length)
        
        timestamp = DateComponents(pumpEventBytes: availableData.subdata(in: 1..<3))
    }
    
    public var dictionaryRepresentation: [String: Any] {
        return [
            "_type": "DailyTotal515",
        ]
    }
}
