//
//  Deeplink+Extensions.swift
//  DeeplinkHelper
//
//  Created by shero on 19.01.2024.
//

import Foundation

extension Deeplink {
    var name: String {
        switch self {
        case .news(let category):
            return "News\(category.rawValue == "none" ? "" : " - \(category.rawValue.camelCaseToWords())")"
        case .markets(let category):
            return "Markets \(category.description.camelCaseToWords())"
        }
    }
    
    var urlString: String {
        switch self {
        case .news(let category):
            return "?screen=news\(category.queryString)"
        case .markets(let segment):
            return "?screen=markets\(segment.queryString)"
        }
    }
    
    static var allCases: [Deeplink] {
        var cases = [Deeplink]()
        NewsSegment.allCases.forEach { cases.append(.news($0)) }
        MarketSegment.allCases.forEach { cases.append(.markets($0)) }
        return cases
    }
}
