//
//  ContentView.swift
//  DeeplinkHelper
//
//  Created by shero on 21.12.2023.
//

import SwiftUI

enum Deeplink: String, CaseIterable, Hashable {
    case markets = "?screen=markets"
    case stocks = "?screen=markets&segment=stocks"
    case moreMenu = "?screen=more_menu"
    case alertCenter = "?screen=alert_center"
    case createAlert = "?screen=create_alert"
    case proLp = "?screen=pro_lp&feature=rtq"
    case adsFreeLp = "?screen=ads_free_lp"
    case newsHeadlines = "?screen=news&segment=headlines"
    
    
    var name: String {
        return String(describing: self).camelCaseToWords()
    }
}

struct ContentView: View {
    private let endpoint: String = "https://qa-ct-8826-apple-applinks.qa.investing.com/apps/"
    
    var body: some View {
            List(Deeplink.allCases, id: \.self) { deeplink in
                if let url = URL(string: endpoint + deeplink.rawValue) {
                    HStack {
                        Button(action: {
                            UIApplication.shared.open(url)
                        }, label: {
                            HStack {
                                Text("\(deeplink.name)")
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "link")
                            }
                            .accessibility(label: Text("deeplink_url+\(deeplink.rawValue)"))
                        })
                    }
                }
            }
            .listStyle(SidebarListStyle())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    ContentView()
}


extension String {
    func camelCaseToWords() -> String {
        let spacedString = unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                return ($0 + " " + String($1)).trimmingCharacters(in: .whitespaces)
            } else {
                return $0 + String($1)
            }
        }
        return spacedString.prefix(1).capitalized + spacedString.dropFirst()
    }
}
