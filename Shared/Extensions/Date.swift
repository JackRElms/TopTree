//
//  Date.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 11/04/2021.
//

import Foundation

extension Date {
    
    func renderMediumDate() -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df.string(from: self)
    }
}
