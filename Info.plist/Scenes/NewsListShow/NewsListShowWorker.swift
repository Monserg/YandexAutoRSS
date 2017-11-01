//
//  NewsListShowWorker.swift
//  YandexAutoRSS
//
//  Created by msm72 on 01.11.2017.
//  Copyright (c) 2017 RemoteJob. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import OMGRssParser

class NewsListShowWorker {
    // MARK: - Business Logic
    func fetchFeed(completionHandler: @escaping (OMGFeedInfo?) -> Void) {
        let rss = [
                        "https://news.yandex.ru/auto.rss",
                        "https://news.yandex.ru/music.rss",
                        "https://news.yandex.ru/showbusiness.rss",
                        "https://news.yandex.ru/movies.rss",
                        "https://news.yandex.ru/gadgets.rss"
                    ]
        
        let rssParser = OMGRssParser(urlStr: rss[Int(arc4random_uniform(UInt32(rss.count)))])

        rssParser.parse(completionHandler: { (info, error) in
            guard let info = info else {
                return completionHandler(nil)
            }
            
            completionHandler(info)
        })
        
//        return completionHandler(nil)
    }
}