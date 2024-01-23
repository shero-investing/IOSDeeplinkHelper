//
//  String+Ext.swift
//  DeeplinkHelper
//
//  Created by shero on 19.01.2024.
//

import Foundation

extension String {
    func camelCaseToWords() -> String {
        let stringWithSpaces = self.replacingOccurrences(of: "_", with: " ")
        
        let spacedString = stringWithSpaces.unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                return ($0 + " " + String($1)).trimmingCharacters(in: .whitespaces)
            } else {
                return $0 + String($1)
            }
        }
        return spacedString.prefix(1).capitalized + spacedString.dropFirst()
    }
}
