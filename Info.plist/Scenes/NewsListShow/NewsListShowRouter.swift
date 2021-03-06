//
//  NewsListShowRouter.swift
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

// MARK: - Input & Output protocols
@objc protocol NewsListShowRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol NewsListShowDataPassing {
    var dataStore: NewsListShowDataStore? { get }
}

class NewsListShowRouter: NSObject, NewsListShowRoutingLogic, NewsListShowDataPassing {
    // MARK: - Properties
    weak var viewController: NewsListShowViewController?
    var dataStore: NewsListShowDataStore?
    
    
    // MARK: - Routing
    //func routeToSomewhere(segue: UIStoryboardSegue?) {
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    
    // MARK: - Navigation
    //func navigateToSomewhere(source: NewsListShowViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}
    
    
    // MARK: - Passing data
    //func passDataToSomewhere(source: NewsListShowDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
