//
//  Deeplink+MarketSegment.swift
//  DeeplinkHelper
//
//  Created by shero on 19.01.2024.
//

import Foundation

extension Deeplink {
    enum MarketSegment: CaseIterable, Equatable, Hashable {
        enum Section: String, CaseIterable, Hashable {
            case mostActive = "most_active"
            case topGainers = "top_gainers"
            case topLosers = "top_losers"
        }
        
        case none
        case indices
        case stocks(Section)
        case forex
        case commodities
        case currency
        case cryptocurrency
        case bonds
        case etfs
        case funds
        case popular
        case indicesFuture
        
        var queryString: String {
            switch self {
            case .none:
                return ""
            case .stocks(let section):
                return "&segment=stocks&section=\(section.rawValue)"
            default:
                return "&segment=\(self.description)"
            }
        }
        
        static var allCases: [MarketSegment] {
            var cases = [MarketSegment]()
            cases.append(.none)
            Section.allCases.forEach { cases.append(.stocks($0)) }
            cases += [.indices, .forex, .commodities, .currency, .cryptocurrency, .bonds, .etfs, .funds, .popular, .indicesFuture]
            return cases
        }
        
        var description: String {
            switch self {
            case .none:
                return ""
            case .stocks(let section):
                return "stocks - \(section.rawValue)"
            case .indicesFuture:
                return "indices_future"
            default:
                return "\(self)"
            }
        }
    }
}
