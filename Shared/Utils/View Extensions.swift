//
//  View Extensions.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 09/05/2021.
//

import Foundation
import SwiftUI

extension View {
   @ViewBuilder
   func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
