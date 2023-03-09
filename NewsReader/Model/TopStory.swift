//
//  TopStory.swift
//  NewsReader
//
//  Created by Andrey on 07.03.2023.
//

import Foundation

struct TopStoryHeadline: Decodable{
    struct Media: Decodable{
        let url: String
    }
    let title: String
    let url: String
    var section: String?
    var byline: String?
}
