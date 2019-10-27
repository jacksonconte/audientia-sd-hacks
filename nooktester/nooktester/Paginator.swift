//
//  Paginator.swift
//  nooktester
//
//  Created by frosty on 10/26/19.
//  Copyright © 2019 frosty. All rights reserved.
//

import Foundation

class Paginator {
    var text: String
    var pages = [String]()
    init(text: String) {
        self.text = text
        self.pages = createPages(text: text)
        
    }
    
    // Splits the text into relevant pages
    func createPages(text: String) -> [String]{
        return [""]
    }
}
