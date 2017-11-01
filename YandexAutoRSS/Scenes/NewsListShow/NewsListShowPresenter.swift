//
//  NewsListShowPresenter.swift
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

// MARK: - Presentation Logic protocols
protocol NewsListShowPresentationLogic {
    func presentFetchedFeedItems(fromResponseModel responseModel: NewsListShowModels.FetchedFeed.ResponseModel)
}

class NewsListShowPresenter: NewsListShowPresentationLogic {
    // MARK: - Properties
    weak var viewController: NewsListShowDisplayLogic?
    
    
    // MARK: - Presentation Logic implementation
    func presentFetchedFeedItems(fromResponseModel responseModel: NewsListShowModels.FetchedFeed.ResponseModel) {
        var displayedFeedItems: [NewsListShowModels.FetchedFeed.ViewModel.DisplayedFeedItem] = []

        if let feed = responseModel.feed, let feedItems = feed.items {
            for item in feedItems {
                let pubDate = item.pubDate!
                let displayedFeedItem = NewsListShowModels.FetchedFeed.ViewModel.DisplayedFeedItem(title: item.title ?? "",
                                                                                                   pubDate: pubDate,
                                                                                                   pubDateString: pubDate.convertToString())
                displayedFeedItems.append(displayedFeedItem)
            }
        }
        
        let viewModel = NewsListShowModels.FetchedFeed.ViewModel(displayedFeedItems: displayedFeedItems.sorted(by: { $0.pubDate > $1.pubDate }))
        viewController?.displayFetchedFeedItems(fromViewModel: viewModel)
    }
}
