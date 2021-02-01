//
//  ContentView.swift
//  Shared
//
//  Created by Dan Hart on 2/1/21.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("items") private var items: CommaSeparatedItems = CommaSeparatedItems(rawValue: "")!
    @SceneStorage("currentItem") private var currentItem: String = ""
    
    var body: some View {
        VStack {
            Text("List Randomizer")
                .font(.largeTitle)
                .padding()
            
            HStack {
                TextField("Item", text: $currentItem)
                Spacer()
                Button(action: {
                    items.values.append(currentItem)
                    currentItem = ""
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
            }.padding()
            
            Divider()
            
            List {
                ForEach(items.values, id: \.self) { (item) in
                    Text(item)
                }
            }
            
            HStack {
                Button(action: {
                    items = CommaSeparatedItems(rawValue: items.values.shuffled().joined(separator: ","))!
                }, label: {
                    Image(systemName: "shuffle.circle.fill")
                })
                
                Spacer()
                
                Button(action: {
                    items = CommaSeparatedItems(rawValue: "")!
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.subheadline)
                })
            }.padding()
        }
    }
}
