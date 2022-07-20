//
//  MSStringAdditions.swift
//  MovieSearch
//

import Foundation

extension String {
    func isEmptyOrWhitespace() -> Bool {
        
        if(self.isEmpty) {
            return true
        }
        
        return (self.trimmingCharacters(in: .whitespaces).isEmpty)
    }
}
