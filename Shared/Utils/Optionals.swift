//
//  Optionals.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 01/05/2021.
//

import Foundation
import SwiftUI

extension Binding {
    func unwrap<Wrapped>() -> Binding<Wrapped>? where Optional<Wrapped> == Value {
        guard let value = self.wrappedValue else { return nil }
        return Binding<Wrapped>(
            get: {
                return value
            },
            set: { value in
                self.wrappedValue = value
            }
        )
    }
}
