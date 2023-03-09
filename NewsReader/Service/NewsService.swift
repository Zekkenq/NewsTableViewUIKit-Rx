//
//  NewsService.swift
//  NewsReader
//
//  Created by Andrey on 07.03.2023.
//

import Foundation
import RxSwift

protocol NewsServiceType{
    func getTopHeadlines()-> Observable<[TopStoryHeadline]>
}

final class NewsService: NewsServiceType{
    func getTopHeadlines() -> Observable<[TopStoryHeadline]> {
        let request = URLRequest(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=KTrWKdNZXY5wmN98XAoUi3RK6C3JES1j")!)
        
struct Response: Decodable{
        let results : [TopStoryHeadline]
    }
        
        return URLSession.shared
            .rx
            .data(request: request)
            .map{
                data in
                try! JSONDecoder().decode(Response.self, from: data)
            }
            .map(\.results)
    }
}
