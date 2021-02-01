//
//  ContentView.swift
//  Shared
//
//  Created by Dan Hart on 2/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [Item] = []
    @State private var currentItem: String = ""
    
    var body: some View {
        VStack {
            Text("List Randomizer")
                .font(.largeTitle)
                .padding()
            
            HStack {
                TextField("Item", text: $currentItem)
                Spacer()
                Button(action: {
                    items.append(Item(name: currentItem))
                    currentItem = ""
                }, label: {
                    Text("Add")
                })
            }.padding()
            
            Divider()
            
            List {
                ForEach(items) { (item) in
                    Text(item.name)
                }
            }
            
            Button(action: {
                items.shuffle()
            }, label: {
                Text("Shuffle")
                    .font(.title)
            })
            
            Spacer()
            
            Button(action: {
                items = []
            }, label: {
                Text("Clear")
                    .font(.subheadline)
            })
            
            Spacer()
        }
    }
}
