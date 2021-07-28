//
//  Video.swift
//  M5WC Video List
//
//  Created by JB on 2021-07-28.
//

import Foundation


class Video: Identifiable, Decodable {
    var id:Int
    var title:String
    var videoURL:String
}
