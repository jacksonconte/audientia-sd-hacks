//
//  Comprehend.swift
//  nooktester
//
//  Created by frosty on 10/26/19.
//  Copyright © 2019 frosty. All rights reserved.
//

import Foundation

class Comprehend {
    
    init() {
        print("a")
    }
    
    func getKeyword(text: String, pageNumber: Int) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let url = URL(string: "http://127.0.0.1:5000/\(pageNumber)")!
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let jsonString = String(data: data!, encoding: .utf8) {
                print(jsonString)
            }

        })

        task.resume()
    }
    
    struct Response: Codable { // or Decodable
      let foo: String
    }
}
