//
//  GameScene.swift
//  StressBomb
//
//  Created by Herbeyg Robledo Reyes on 8/3/18.
//  Copyright © 2018 TeamLynx. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var square = SKSpriteNode()
    var circle = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        square = self.childNode(withName: "square") as! SKSpriteNode
        square.texture = SKTexture(imageNamed: "Square_figure_1")
        square.physicsBody?.affectedByGravity = true
        
        circle = self.childNode(withName: "circle") as! SKSpriteNode
        circle.texture = SKTexture(imageNamed: "Circle_figure_1")
        circle.physicsBody?.affectedByGravity = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if square.contains(location){
                square.position = location
            }
        }
    }
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        for touch in touches {
//            let location = touch.location(in: self)
//            square.run(SKAction.moveTo(x: location.x, duration: 0.0))
//            square.run(SKAction.moveTo(y: location.y, duration: 0.0))
//
//            circle.run(SKAction.moveTo(x: location.x, duration: 0.0))
//            circle.run(SKAction.moveTo(y: location.y, duration: 0.0))
//        }
//    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if square.contains(location){
                square.position = location
            }
            
//            square.run(SKAction.moveTo(x: location.x, duration: 0.0))
//            square.run(SKAction.moveTo(y: location.y, duration: 0.0))
//
//            circle.run(SKAction.moveTo(x: location.x, duration: 0.0))
//            circle.run(SKAction.moveTo(y: location.y, duration: 0.0))
        }
    }
}
