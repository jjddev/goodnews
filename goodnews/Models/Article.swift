//
//  Article.swift
//  goodnews
//
//  Created by juliano jose dziadzio on 17/09/19.
//  Copyright © 2019 juliano jose dziadzio. All rights reserved.
//

import Foundation


struct ArticleList: Decodable {
    let articles: [Article]
}
struct Article: Decodable {
    let title: String
    let description: String
    
}
