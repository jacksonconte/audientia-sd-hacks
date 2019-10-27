//
//  PageViewController.swift
//  nooktester
//
//  Created by frosty on 10/26/19.
//  Copyright © 2019 frosty. All rights reserved.
//

import AVFoundation
import Foundation
import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
		
        let pageViewController = UIPageViewController(
            transitionStyle: .pageCurl,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [controllers[0]], direction: .forward, animated: true)
    }
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
		var audioPlayer : AVAudioPlayer!
		// initialization of audio player tagged along here
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
			print("backwards!")
			pageSound()
			// TODO: remove print statement and add sound function call
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return parent.controllers.last
            }
            return parent.controllers[index - 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
			print ("forwards!")
			// TODO: remove print statement
			pageSound()
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            }
            return parent.controllers[index + 1]
        }
		//TODO: get function to play appropriate text sounds,
		// but first to actually play in the first place
		func pageSound() {
			let file = Bundle.main.path(forResource: "pageturn", ofType: "wav")
			print(file!) //not just a "file", but a FILE! YEAHHH LETS GOOOOO
			do {
			audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: file!))
				// the "!" in the line above force unwraps
			} catch {
				print (error)
			}
			audioPlayer.play()
		}
    }
}
