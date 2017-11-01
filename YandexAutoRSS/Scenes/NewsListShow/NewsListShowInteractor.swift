//
//  NewsListShowInteractor.swift
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

// MARK: - Business Logic protocols
protocol NewsListShowBusinessLogic {
    func doSomething(request: NewsListShowModels.Something.RequestModel)
}

protocol NewsListShowDataStore {
    //var name: String { get set }
}

class NewsListShowInteractor: NewsListShowBusinessLogic, NewsListShowDataStore {
    // MARK: - Properties
    var presenter: NewsListShowPresentationLogic?
    var worker: NewsListShowWorker?
    //var name: String = ""
    
    
    // MARK: - Business logic implementation
    func doSomething(request: NewsListShowModels.Something.RequestModel) {
        worker = NewsListShowWorker()
        worker?.doSomeWork()
        
        let responseModel = NewsListShowModels.Something.ResponseModel()
        presenter?.presentSomething(response: responseModel)
    }
}