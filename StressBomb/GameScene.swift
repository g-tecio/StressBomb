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
    
    override func didMove(to view: SKView) {
        
        square = self.childNode(withName: "Image") as! SKSpriteNode
        square.physicsBody?.affectedByGravity = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            square.run(SKAction.moveTo(x: location.x, duration: 0.0))
            square.run(SKAction.moveTo(y: location.y, duration: 0.0))
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            square.run(SKAction.moveTo(x: location.x, duration: 0.0))
            square.run(SKAction.moveTo(y: location.y, duration: 0.0))
            
        }
    }
}


