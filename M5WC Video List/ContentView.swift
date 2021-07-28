//
//  ContentView.swift
//  M5WC Video List
//
//  Created by JB on 2021-07-28.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text("Search Bar")
                    .padding()
                ScrollView {
                    LazyVStack{
                        Text("1")
                        Text("2")
                    }
                }

            }
            .navigationTitle("All Videos")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
