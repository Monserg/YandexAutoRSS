//
//  NewsDetailShowInteractor.swift
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
import FeedKit

// MARK: - Business Logic protocols
protocol NewsDetailShowBusinessLogic {
    func doSomething(request: NewsDetailShowModels.FeedItem.RequestModel)
}

protocol NewsDetailShowDataStore {
    var feedItem: RSSFeedItem! { get set }
}

class NewsDetailShowInteractor: NewsDetailShowBusinessLogic, NewsDetailShowDataStore {
    // MARK: - Properties
    var presenter: NewsDetailShowPresentationLogic?
    var worker: NewsDetailShowWorker?
    
    var feedItem: RSSFeedItem!
    
    
    // MARK: - Business logic implementation
    func doSomething(request: NewsDetailShowModels.FeedItem.RequestModel) {
        worker = NewsDetailShowWorker()
//        worker?.doSomeWork()
        
        let enclosure = feedItem.enclosure
        let imageURLString = (enclosure?.attributes?.type == "image/jpeg") ? enclosure?.attributes?.url : nil
        
        let responseModel = NewsDetailShowModels.FeedItem.ResponseModel(title: feedItem.title!, description: feedItem.description!, imageURLString: imageURLString)
        presenter?.presentFeedItem(fromResponseModel: responseModel)
    }
}
