//
//  ViewController.swift
//  testApp Vesti Reader
//
//  Created by Zakirzhan Aisabaev on 31.10.17.
//  Copyright © 2017 Zakirzhan Aisabaev. All rights reserved.
//

import UIKit
import Cartography

 class ViewController: UIViewController {
    
    var news = [News]()
    
    lazy var activityIndicator:UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        return activityIndicator
    }()
    
     var refreshControl:UIRefreshControl!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
         tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "newsCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        return tableView
    }()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshCont()
        view.addSubview(tableView) 
        configureConstraints()
        self.title = "Последние Новости"  
        self.loadData()
    }
    
    func loadData(){
        News.parse(){ [unowned self] (feed, error) in
            guard let news = feed else { return }
            self.news = feed!
            self.tableView.reloadData()
        }
    }
    func configureConstraints() {
        constrain(tableView,view) { tv, v in
            tv.edges == v.edges
        }
    }
    func refreshCont() {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Пожалуйста, подождите...")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(sender:AnyObject) {
        refreshBegin(newtext: "Обновление",
                     refreshEnd: {(x:Int) -> () in
                        self.tableView.reloadData()
                        self.refreshControl.endRefreshing()
        })
    }
    
    func refreshBegin(newtext:String, refreshEnd:@escaping (Int) -> ()) {
        DispatchQueue.global().async {
             self.loadData()
            sleep(1)
            DispatchQueue.main.async() {
                refreshEnd(0)
            }
        }
    }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = news[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.selectionStyle = .none
        cell.configure(with: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showNews(news[indexPath.row])
    }
    
    func showNews(_ post: News) {
        let vc = ShowNewsViewController()
        vc.news = post
        navigationController?.pushViewController(vc, animated: true)
    }
}

