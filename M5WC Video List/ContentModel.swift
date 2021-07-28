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
        
        getLocalData()

        //getRemoteData()
        
    }
    
    
    func getLocalData() {
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "Data", withExtension: "json")
        
        guard jsonUrl != nil else {
            print("Bad jsonURL")
            return
        }
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of videos
            let jsonDecoder = JSONDecoder()
            let videoData = try jsonDecoder.decode([Video].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.videos = videoData
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        
    }
    
    func getRemoteData() {
        
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
            
            
            do {
                let decoder = JSONDecoder()

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
