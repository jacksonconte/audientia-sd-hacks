//
//  ContentView.swift
//  nooktester
//
//  Created by frosty on 10/26/19.
//  Copyright © 2019 frosty. All rights reserved.
//


// max num chars per page w/ chapter = 1500 (1493)





import SwiftUI

struct ContentView<Page: View>: View{
    var viewControllers: [UIHostingController<Page>]

    /*
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
 */

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                PageViewController(controllers: viewControllers)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(someText.map { Pages(text: $0) }).aspectRatio(3/2, contentMode: .fit)
    }
}
