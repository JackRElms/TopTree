//
//  AddItemSheetView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 06/04/2021.
//

import SwiftUI

struct AddItemSheetView: View {
    
    @EnvironmentObject var item: ItemInstance
    
    var body: some View {
        NavigationView {
            TextField("Test", text: $item.nameOne)
                .navigationBarTitle(Text("Notifications"), displayMode: .inline)
        }
        
    }
}
