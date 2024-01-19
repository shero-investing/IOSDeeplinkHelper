//
//  Deeplink.swift
//  DeeplinkHelper
//
//  Created by shero on 19.01.2024.
//

import Foundation

enum Deeplink: Equatable, CaseIterable, Hashable {
    case news(NewsSegment)
    case markets(MarketSegment)
    
    var sectionName: String {
        switch self {
        case .news:
            return "News"
        case .markets:
            return "Markets"
        }
    }
}
