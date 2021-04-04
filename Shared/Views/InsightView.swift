//
//  SwiftUIView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 04/04/2021.
//

import SwiftUI

struct InsightView: View {
    @State var iosGridLayout = [ GridItem(.flexible()) ]
    @State var ipadosGridLayout = [ GridItem(.flexible()), GridItem(.flexible()) ]

    var item: Item
    
    private func determineGridLayout() -> Array<GridItem> {
        var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
        if idiom == .pad {
            return [ GridItem(.flexible()), GridItem(.flexible()) ]
        } else {
            return [ GridItem(.flexible()) ]
        }
    }

    private struct NamedFont: Identifiable {
        let name: String
        let font: Font
        var id: String { name }
    }

    private let namedFonts: [NamedFont] = [
        NamedFont(name: "Large Title", font: .largeTitle),
        NamedFont(name: "Title", font: .title),
        NamedFont(name: "Headline", font: .headline),
        NamedFont(name: "Body", font: .body),
        NamedFont(name: "Caption", font: .caption)
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: determineGridLayout(), alignment: .leading, spacing: 0) {
                ZStack(alignment: .topLeading, content: {
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor(named: "LightGray")!))
                        .frame(height: 200)
                    VStack(alignment: .leading, spacing: 5, content: {
                        VStack(alignment: .leading, spacing: nil, content: {
                            Text("Today")
                                .font(.title)
                                .bold()
                            Text("2 Completed")
                                .font(.body)
                            Text("Almost there, you only have 1 task left")
                                .font(.body)
                        }).padding(.bottom)
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text(item.nameOne)
                        }
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text(item.nameTwo)
                        }
                        HStack {
                            Image(systemName: "minus.circle.fill")
                            Text(item.nameThree)
                        }

                    })
                    .padding()
                })
            }
            .padding(.all, 10)
            .animation(.interactiveSpring())
            .navigationBarTitle("Insights")
        }
    }
}
