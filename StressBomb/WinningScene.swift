//
//  GameOverScene.swift
//  StressBomb
//
//  Created by Herbeyg Robledo Reyes on 8/15/18.
//  Copyright © 2018 TeamLynx. All rights reserved.
//

import SpriteKit

class WinningScene: SKScene {
    
    var background = SKSpriteNode()
    var happyFace = SKSpriteNode()
    var bin = SKSpriteNode()
    var timerBase = SKSpriteNode()
    var timerNeedle = SKSpriteNode()
    var blackScreen = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        //SAD FACE
        happyFace = SKSpriteNode(imageNamed: "SmileyFace")
        happyFace.zPosition = 5
        happyFace.size = CGSize(width: 430, height: 320)
        happyFace.position = CGPoint(x: self.frame.size.width / 2.6, y: self.frame.size.width / 3.5)
        self.addChild(happyFace)
        
        
        //BACKGROUND BOARD
        background = SKSpriteNode(imageNamed: "Background")
        background.zPosition = 1
        background.size = CGSize(width: (frame.size.width),  height: frame.size.height)
        background.position = CGPoint(x: (frame.size.width/2), y: frame.size.height/2)
        self.addChild(background)
        
        
        //BIN
        bin = SKSpriteNode(imageNamed: "Container_Empty")
        bin.zPosition = 2
        bin.size = CGSize(width: 120, height: 165)
        bin.position = CGPoint(x: self.frame.size.width / 1.140, y: self.frame.size.width / 5.5)
        self.addChild(bin)
        
        //TIMER
        timerBase = SKSpriteNode(imageNamed: "Timer_Base")
        timerBase.zPosition = 2
        timerBase.size = CGSize(width: 90, height: 90)
        timerBase.position = CGPoint(x: self.frame.size.width / 1.150, y: self.frame.size.width / 2.3)
        self.addChild(timerBase)
        
        //TIMER NEEDLE
        timerNeedle = SKSpriteNode(imageNamed: "Timer_Needle")
        timerNeedle.zPosition = 3
        //timerNeedle.zRotation = CGFloat(Double.pi / 4)
        timerNeedle.size = CGSize(width: 65, height: 65)
        timerNeedle.position = CGPoint(x: self.frame.size.width / 1.150, y: self.frame.size.width / 2.3)
        self.addChild(timerNeedle)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.fade(with: UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0), duration: 0.2)
        
        let gameOver = SKScene(fileNamed: "GameScene") as! SKScene
        
        self.view!.presentScene(gameOver, transition: transition)
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
}
