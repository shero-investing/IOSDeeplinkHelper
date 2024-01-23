//
//  ContentView.swift
//  DeeplinkHelper
//
//  Created by shero on 21.12.2023.
//

import SwiftUI

struct ContentView: View {
    private var sections: [String: [Deeplink]] {
        Dictionary(grouping: Deeplink.allCases, by: { $0.sectionName })
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sections.keys.sorted(), id: \.self) { sectionName in
                    Section(sectionName) {
                        ForEach(sections[sectionName] ?? [], id: \.self) { deeplink in
                            LinkItem(deeplink: deeplink)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LinkItem: View {
    let deeplink: Deeplink
    private let endpoint: String = "https://investing.com/apps/"
    
    var body: some View {
        if let url = URL(string: endpoint + deeplink.urlString) {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        UIApplication.shared.open(url)
                    }, label: {
                        HStack {
                            Text(deeplink.name)
                                .font(.headline)
                            Spacer()
                            Image(systemName: "link")
                        }
                    })
                }
                Text(deeplink.urlString)
                    .foregroundColor(.secondary)
                    .font(.caption2)
            }
        }
    }
}

#Preview {
    ContentView()
}
