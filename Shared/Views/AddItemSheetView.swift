//
//  AddItemSheetView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 06/04/2021.
//

import SwiftUI

struct AddItemSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var task: Task?
    @Binding var listId: UUID
    @State var blankTaskName = ""
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            VStack {
                Text("What will you work on today?")
                    .font(.largeTitle)
                    .bold()
                    .padding(30)
                if task != nil {
                    TextField("Today I will...", text: $task.unwrap()!.name)
                        .padding(15)
                        .background(Color(UIColor.secondarySystemFill))
                        .cornerRadius(12)
                        .padding(25)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                } else {
                    TextField("Today I will...", text: $blankTaskName)
                        .padding(15)
                        .background(Color(UIColor.secondarySystemFill))
                        .cornerRadius(12)
                        .padding(25)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                Button("Save") {
                    if task?.name == nil {
                        do {
                            try Task.createTask(blankTaskName)
                        } catch {
                            print("### \(#function): Failed to create Task: \(error)")
                        }
                    }
                    self.listId = UUID()
                    self.presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.accentColor)
                .cornerRadius(12)
                .padding(20)
            }
            .navigationBarTitle(Text("Create Event"), displayMode: .inline)
            .navigationBarItems(leading:
            Button("Close") {
                self.presentationMode.wrappedValue.dismiss()
            }, trailing:
            Button("Delete") {
                if task != nil {
                    do {
                        try Task.deleteTask(taskId: (task?.uuid)!)
                    } catch {
                        print(error)
                    }
                }
                self.presentationMode.wrappedValue.dismiss()
            })
        }
   }
}
