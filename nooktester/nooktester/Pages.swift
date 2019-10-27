//
//  Pages.swift
//  nooktester
//
//  Created by frosty on 10/26/19.
//  Copyright © 2019 frosty. All rights reserved.
//

import Foundation
import SwiftUI

struct Pages: View {
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Spacer()
                Text("Chapter 5")
                .font(.title).bold()
                Spacer()
                }
            HStack(alignment: .top) {
                Spacer()
				Text(text)
					.font(.body)
					.fontWeight(.regular)
					
                
                Spacer()
            }
        }
    }
}

struct Pages_Previews: PreviewProvider {
    static var previews: some View {
        Pages(text: someText[0]).aspectRatio(contentMode: .fill)
    }
}
