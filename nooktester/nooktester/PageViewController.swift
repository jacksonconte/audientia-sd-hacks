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
        var pageSoundPlayer : AVAudioPlayer! //audio player intialization is in a weird spot. deal with it.
        var ambientSoundPlayer : AVAudioPlayer!

        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        // backwards
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            playSound(i: index)
            if index == 0 {
                return parent.controllers.last
            }
            return parent.controllers[index - 1]
        }

        // forwards
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            playSound(i: index)
            if index + 1 == parent.controllers.count {
                
                print(Comprehend().getKeyword(text: someText[0], pageNumber: parent.controllers.count-1))
                return parent.controllers.first
            }
            print(Comprehend().getKeyword(text: someText[0], pageNumber: index+1))
            return parent.controllers[index + 1]
        }
        func playSound(i: Int) {
                let pageSoundPath = Bundle.main.path(forResource: "pageturn", ofType: "wav")
                do {
                    pageSoundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pageSoundPath!))
                    // the "!" in the line above force unwraps
                    let ambientSoundPath = ""
                    // hard-coded page logic
                    switch i {
                        //sets ambientSound to whatever filepath we need
                    case 0:
                        print("a")
                        let ambientSoundPath = try Bundle.main.path(forResource: "birds", ofType: "mp3")
                        ambientSoundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: ambientSoundPath!))
                        break; //no one can stop me from using these semicolons. #JavaGang
                    case 1:
                        print("b")
                        let ambientSoundPath = try Bundle.main.path(forResource: "cafe", ofType: "mp3")
                        ambientSoundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: ambientSoundPath!))
                        break;
                    case 2:
                        print("c")
                        let ambientSoundPath = try Bundle.main.path(forResource: "traffic", ofType: "mp3")
                        ambientSoundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: ambientSoundPath!))
                        break;
                    case 3:
                        print("d")
                        let ambientSoundPath = try Bundle.main.path(forResource: "office", ofType: "mp3")
                        ambientSoundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: ambientSoundPath!))
                        break;
                    case 4:
                        let ambientSoundPath = try Bundle.main.path(forResource: "sexytimes", ofType: "mp3")
                        ambientSoundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: ambientSoundPath!))
                        break;
                    default:
                        print("if you're reading this, you're program's screwed.")
                        let ambientSoundPath = try Bundle.main.path(forResource: "birds", ofType: "mp3")
                        ambientSoundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: ambientSoundPath!))
                        break; //why. just why.
                    }
                    
                } catch {
                    print (error)
                }
                pageSoundPlayer.play();
                ambientSoundPlayer.play();
            }
    }
    
}
