//
//  Video.swift
//  M5WC Video List
//
//  Created by JB on 2021-07-28.
//

import Foundation


class Video: Decodable, Identifiable {

    var id: Int
    var title: String
    var url: String
}
