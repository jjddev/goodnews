//
//  NewsListTableViewController.swift
//  goodnews
//
//  Created by juliano jose dziadzio on 17/09/19.
//  Copyright © 2019 juliano jose dziadzio. All rights reserved.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private let apiUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8610318763714b18b475eb9db927f9c0"
    private var articleListVM: ArticleListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        print("e agora")
    }
    
    private func setup(){
        navigationController?.navigationBar.prefersLargeTitles = true

        
        Webservice().getArticles(url: URL(string: apiUrl)!) { articles  in
            if let _articles = articles {
                self.articleListVM = ArticleListViewModel(articles: _articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return articleListVM == nil ? 0 : articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleListVM.numberOfRowsInsections(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell
            else { fatalError("cell not found") }
        
        let articleVM = articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
   

}
