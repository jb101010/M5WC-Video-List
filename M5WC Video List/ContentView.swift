//
//  ContentView.swift
//  M5WC Video List
//
//  Created by JB on 2021-07-28.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
 
                Text("Search Bar")
                    .padding()
                
                List {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.videos) { video in
                            
                            VStack {
                                
                                NavigationLink(
                                    destination: VideoView(video: video),
                                    label: {
                                        Text(video.title)
                                            .font(.body)
                                            .padding()
                                            
                                    })
                            }
                        }

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
            .environmentObject(ContentModel())
    }
}
