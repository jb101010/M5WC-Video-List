//
//  VideoView.swift
//  M5WC Video List
//
//  Created by JB on 2021-07-28.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    var video: Video
    
    var body: some View {
        
        let url = URL(string: video.url)
        
        VStack (alignment: .leading) {
            
            Text(video.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VideoPlayer(player: AVPlayer(url: url!))
                .frame(height: 200)
                .cornerRadius(10)

            Spacer()
        }
        .padding()
    }
}

//struct VideoView_Previews: PreviewProvider {
//
//    @EnvironmentObject var model: ContentModel
//
//    static var previews: some View {
//        VideoView(model.videos[0])
//
//    }
//}
