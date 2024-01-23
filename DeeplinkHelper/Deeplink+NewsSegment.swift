//
//  Deeplink+NewsSegment.swift
//  DeeplinkHelper
//
//  Created by shero on 19.01.2024.
//

import Foundation

extension Deeplink {
    enum NewsSegment: String, Equatable, CaseIterable, Hashable {
        case none
        case popular
        case latest
        case cryptocurrency
        case commodities
        case stock
        case forex
        case economicIndicators = "economic_indicators"
        case economy
        case politics
        case world
        case general
        case headlines
        case personalFinance = "personal_finance"
        
        var queryString: String {
            switch self {
            case .none:
                return ""
            default:
                return "&segment=\(self.rawValue)"
            }
        }
    }
}
