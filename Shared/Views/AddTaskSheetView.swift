//
//  AddItemSheetView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 06/04/2021.
//

import SwiftUI

struct AddTaskSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTask: Task
    

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: nil, content: {
                HStack {
                    TextField("Enter task here", text: $selectedTask.name)
                        .font(.body)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.secondarySystemBackground)))
                        .foregroundColor(.black)
                    Button(action: {
                        if selectedTask.uuid == nil {
                            try! Task.createTask(selectedTask.name, taskOrder: 2)
                            presentationMode.wrappedValue.dismiss()
                            return
                        }
                        if selectedTask.uuid != nil {
                            try! Task.updateTask(selectedTask)
                            presentationMode.wrappedValue.dismiss()
                            return
                        }
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
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                })
        }
    }
}
