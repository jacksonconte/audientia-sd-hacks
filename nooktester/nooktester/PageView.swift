//
//  PageView.swift
//  nooktester
//
//  Created by frosty on 10/26/19.
//  Copyright © 2019 frosty. All rights reserved.
//

import Foundation
import SwiftUI

var someText = ["In the morning I walked down the Boulevard to the rue Soufflot for coffee and brioche. It was a fine morning. The horse-chestnut trees in the Luxembourg gardens were in bloom. There was the pleasant early-morning feeling of a hot day. I read the papers with the coffee and then smoked a cigarette. The flower-women were coming up from the market and arranging their daily stock. Students went by going up to the law school, or down to the Sorbonne. The Boulevard was busy with trams and people going to work. I got on an S bus and rode down to the Madeleine, standing on the back platform. From the Madeleine I walked along the Boulevard des Capucines to the Opéra, and up to my office. I passed the man with the jumping frogs and the man with the boxer toys. I stepped aside to avoid walking into the thread with which his girl assistant manipulated the boxers. She was standing looking away, the thread in her folded hands. The man was urging two tourists to buy. Three more tourists had stopped and were watching. I walked on behind a man who was pushing a roller that printed the name CINZANO on the sidewalk in damp letters. All along people were going to work. It felt pleasant to be going to work. I walked across the avenue and turned in to my office.\n\nUp-stairs in the office I read the French morning papers, smoked, and then sat at the typewriter and got off a good morning's work. At eleven o'clock I went over to the Quai d'Orsay in a taxi and went in and sat with about a dozen", "correspondents, while the foreign-office mouthpiece, a young Nouvelle Revue Française diplomat in horn-rimmed spectacles, talked and answered questions for half an hour. The President of the Council was in Lyons making a speech, or, rather he was on his way back. Several people asked questions to hear themselves talk and there were a couple of questions asked by news service men who wanted to know the answers. There was no news. I shared a taxi back from the Quai d'Orsay with Woolsey and Krum.\n\n\"What do you do nights, Jake?\" asked Krum. \"I never see you around.\"\n\n\"Oh, I'm over in the Quarter.\"\n\n\"I'm coming over some night. The Dingo. That's the great place, isn't it?\"\n\n\"Yes. That, or this new dive, The Select.\"\n\n\"I've meant to get over,\" said Krum. \"You know how it is, though, with a wife and kids.\"\n\n\"Playing any tennis?\" Woolsey asked.\n\n\"Well, no,\" said Krum. \"I can't say I've played any this year. I've tried to get away, but Sundays it's always rained, and the courts are so damned crowded.\"", "\n\n\"The Englishmen all have Saturday off,\" Woolsey said.\n\n\"Lucky beggars,\" said Krum. \"Well, I'll tell you. Some day I'm not going to be working for an agency. Then I'll have plenty of time to get out in the country.\"\n\n\"That's the thing to do. Live out in the country and have a little car.\"\n\n\"I've been thinking some about getting a car next year.\"\n\nI banged on the glass. The chauffeur stopped. \"Here's my street,\" I said., \"Come in and have a drink.\"\n\n\"Thanks, old man,\" Krum said. Woolsey shook his head. \"I've got to file that line he got off this morning.\"\n\nI put a two-franc piece in Krum's hand.\n\n\"You're crazy, Jake,\" he said. \"This is on me.\"\n\n\"It's all on the office, anyway.\"\n\n\"Nope. I want to get it.\"\n\nI waved good-by. Krum put his head out. \"See you at the lunch on Wednesday.\"", "\n\n\"You bet.\"\n\nI went to the office in the elevator. Robert Cohn was waiting for me. \"Hello, Jake,\" he said. \"Going out to lunch?\"\n\n\"Yes. Let me see if there is anything new.\"\n\n\"Where will we eat?\"\n\n\"Anywhere.\"\n\nI was looking over my desk. \"Where do you want to eat?\"\n\n\"How about Wetzel's? They've got good hors d'oeuvres.\"\n\nIn the restaurant we ordered hors d'oeuvres and beer. The sommelier brought the beer, tall, beaded on the outside of the steins, and cold. There were a dozen different dishes of hors d'oeuvres.\n\n\"Have any fun last night?\" I asked.\n\n\"No. I don't think so.\"\n\n\"How's the writing going?\"\n\n\"Rotten. I can't get this second book going.\"", "\n\n\"That happens to everybody.\"\n\n\"Oh, I'm sure of that. It gets me worried, though.\"\n\n\"Thought any more about going to South America?\"\n\n\"I mean that.\"\n\n\"Well, why don't you start off?\"\n\n\"Frances.\"\n\n\"Well,\" I said, \"take her with you.\"\n\n\"She wouldn't like it. That isn't the sort of thing she likes. She likes a lot of people around.\"\n\n\"Tell her to go to hell.\"\n\n\"I can't. I've got certain obligations to her.\"\n\nHe shoved the sliced cucumbers away and took a pickled herring.\n\n\"What do you know about Lady Brett Ashley, Jake?\"\n\n\"Her name's Lady Ashley. Brett's her own name. She's a nice girl,\" I said. \"She's getting a divorce and she's going to marry Mike Campbell. He's over in Scotland now. Why?\"\n\n\"She's a remarkably attractive woman.\""]

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        PageViewController(controllers: viewControllers)
    }
}

struct PageView_Preview: PreviewProvider {
    static var previews: some View {
        PageView(someText.map { Pages(text: $0) })
    }
}
