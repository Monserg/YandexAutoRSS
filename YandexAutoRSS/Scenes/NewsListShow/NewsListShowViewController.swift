//
//  NewsListShowViewController.swift
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
protocol NewsListShowDisplayLogic: class {
    func displayFetchedFeedItems(fromViewModel viewModel: NewsListShowModels.FetchedFeed.ViewModel)
}

class NewsListShowViewController: UIViewController {
    // MARK: - Properties
    var interactor: NewsListShowBusinessLogic?
    var router: (NSObjectProtocol & NewsListShowRoutingLogic & NewsListShowDataPassing)?
    
    var displayedFeedItems: [NewsListShowModels.FetchedFeed.ViewModel.DisplayedFeedItem] = []

    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 44
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
        
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    
    // MARK: - Setup
    private func setup() {
        let viewController          =   self
        let interactor              =   NewsListShowInteractor()
        let presenter               =   NewsListShowPresenter()
        let router                  =   NewsListShowRouter()
        
        viewController.interactor   =   interactor
        viewController.router       =   router
        interactor.presenter        =   presenter
        presenter.viewController    =   viewController
        router.viewController       =   viewController
        router.dataStore            =   interactor
    }
    
    
    // MARK: - Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchFeedsLoad()
    }
    
    
    // MARK: - Custom Functions
    func fetchFeedsLoad() {
        spinner.startAnimating()
        tableView.separatorStyle = .none
        displayedFeedItems = []
        navigationItem.title = "Loading RSS"
        tableView.reloadData()
        
        DispatchQueue.main.async {
            Thread.sleep(forTimeInterval: 0.5)
            
            OperationQueue.main.addOperation() {
                self.view.isUserInteractionEnabled = false
                let requestModel = NewsListShowModels.FetchedFeed.RequestModel(index: self.segmentedControl.selectedSegmentIndex)
                self.interactor?.fetchFeed(withRequestModel: requestModel)
            }
        }
    }
    
    
    // MARK: - Actions
    @IBAction func handlerSegmentedControlChangedValue(_ sender: UISegmentedControl) {
        fetchFeedsLoad()
    }
}


// MARK: - UITableViewDataSource
extension NewsListShowViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedFeedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedFeedItem = displayedFeedItems[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "FeedItemCell")
        
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "FeedItemCell")
        }
        
        cell?.textLabel?.text = displayedFeedItem.title
        cell?.textLabel?.numberOfLines = 0
        cell?.detailTextLabel?.text = displayedFeedItem.pubDateString
        
        return cell!
    }
}


// MARK: - UITableViewDelegate
extension NewsListShowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToNewsDetailShowScene()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - NewsListShowDisplayLogic
extension NewsListShowViewController: NewsListShowDisplayLogic {
    func displayFetchedFeedItems(fromViewModel viewModel: NewsListShowModels.FetchedFeed.ViewModel) {
        // NOTE: Display the result from the Presenter
        navigationItem.title = viewModel.displayedFeedItems.count == 0 ? "Empty Feed" : router?.dataStore?.feed?.title
        
        displayedFeedItems = viewModel.displayedFeedItems
        tableView.separatorStyle = .singleLine
        tableView.reloadData()
        
        view.isUserInteractionEnabled = true
        spinner.stopAnimating()
    }
}
