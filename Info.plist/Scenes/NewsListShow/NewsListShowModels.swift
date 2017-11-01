//
//  NewsListShowModels.swift
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

// MARK: - Data models
enum NewsListShowModels {
    // MARK: - Use cases
    enum FetchedFeed {
        struct RequestModel {
        }
        
        struct ResponseModel {
            var feed: OMGFeedInfo?
        }
        
        struct ViewModel {
            struct DisplayedFeedItem {
                var title: String
                var pubDate: Date
                var pubDateString: String
            }
            
            var displayedFeedItems: [DisplayedFeedItem]
        }
    }
}

