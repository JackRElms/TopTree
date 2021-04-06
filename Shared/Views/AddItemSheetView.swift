//
//  AddItemSheetView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 06/04/2021.
//

import SwiftUI

struct AddItemSheetView: View {
    
    @Binding var item: Item
    
    var body: some View {
        NavigationView {
            TextField("Test", text: $item.nameOne)
                .navigationBarTitle(Text("Notifications"), displayMode: .inline)
        }
        
    }
}

struct AddItemSheetView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddItemSheetView(item: <#Binding<Item>#>)
    }
}
