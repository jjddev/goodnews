//
//  Webservice.swift
//  goodnews
//
//  Created by juliano jose dziadzio on 17/09/19.
//  Copyright © 2019 juliano jose dziadzio. All rights reserved.
//

import Foundation

class Webservice {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ())  {
        URLSession.shared.dataTask(with: url){  data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let _data = data {
                let articles = try? JSONDecoder().decode(ArticleList.self, from: _data).Articles
                if let _articles = articles {
                    completion(_articles)
                }
            }
        }.resume()
    }
}
