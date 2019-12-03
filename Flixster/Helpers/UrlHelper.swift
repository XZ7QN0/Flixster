//
//  UrlFetcher.swift
//  Flixster
//
//  Created by Jonathon Chenvert on 12/3/19.
//  Copyright © 2019 Jonathon Chenvert. All rights reserved.
//

//  Questions
//  What is completion, and what does it do?
//  Why does the return happen within the "else if let" block of code, rather than towards the end of the func?

import Foundation

struct UrlHelper {
    static func fetchApiUrl(apiUrl: String, completion: @escaping ([[String:Any]]?) -> Void) {
        let url = URL(string: apiUrl)!
        var movieList = [[String:Any]]()
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
           } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                movieList = dataDictionary["results"] as! [[String:Any]]
                
                return completion(movieList)
           }
        }
        task.resume()
    }
    
    static func getImageURL(baseUrl: String, imagePath: String) -> URL {
        return URL(string: baseUrl + imagePath)!
    }
}
