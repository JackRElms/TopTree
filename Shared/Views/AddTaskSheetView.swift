//
//  AddItemSheetView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 06/04/2021.
//

import SwiftUI

struct AddTaskSheetView: View {
    
    @FetchRequest var tasks: FetchedResults<Task>
    @Binding var showingSheet: Bool
    @Binding var selectedItem: String

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: nil, content: {
                HStack {
                    TextField("Enter task here", text: $selectedItem)
                        .font(.body)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.secondarySystemBackground)))
                        .foregroundColor(.black)
                    Button(action: {
                        try! Task.createTask(selectedItem, taskOrder: 2)
                        showingSheet.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.accentColor)
                    }
                    .padding(.leading)
                }
            }).padding(20)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitle(Text("Add a new task"))
                .navigationBarItems(leading: Button(action: {
                    showingSheet.toggle()
                }) {
                    Text("Cancel")
                })
        }
    }
}
