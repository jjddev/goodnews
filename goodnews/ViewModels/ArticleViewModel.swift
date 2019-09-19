//
//  ArticleViewModel.swift
//  goodnews
//
//  Created by juliano jose dziadzio on 18/09/19.
//  Copyright © 2019 juliano jose dziadzio. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]!
}


extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInsections(_ section: Int ) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}



struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}


extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}

