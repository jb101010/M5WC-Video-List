//
//  ContentModel.swift
//  M5WC Video List
//
//  Created by JB on 2021-07-28.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var videos = [Video]()
    
    init() {
        
        getRemoteDate()
        
    }
    
    func getRemoteDate() {
        
        let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                // print(error)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let videoData = try decoder.decode([Video].self, from: data!)
                
                DispatchQueue.main.async {
                    self.videos = videoData
                }

            }
            catch {
                print(error)
            }
        }
        dataTask.resume()
        
    }
}
