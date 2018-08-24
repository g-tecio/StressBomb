//
//  GameViewController.swift
//  StressBomb
//
//  Created by Herbeyg Robledo Reyes on 8/3/18.
//  Copyright © 2018 TeamLynx. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import Lottie

class GameViewController: UIViewController {
    var value:Double = 1.0
    var timerIntro = Timer()
    let intro = LOTAnimationView(name: "Intro")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intro.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        intro.contentMode = .scaleAspectFill
        self.view.addSubview(intro)
        intro.play{ (finished) in
            
            self.timerIntro = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(self.kmClock), userInfo: nil, repeats: true)
            //self.intro.removeFromSuperview()
            
            
        }
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            //view.ignoresSiblingOrder = true
            //view.showsFPS = false
            //view.showsNodeCount = false
        }
    }
    
    
    @objc func kmClock() {
        
        
        value = value - 0.1
        intro.alpha = CGFloat(value)
        
        // print("ALPHA", value)
        if self.value == 0.1 {
            //  print("INVALIDAR", self.value)
            self.timerIntro.invalidate()
        }
        
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
