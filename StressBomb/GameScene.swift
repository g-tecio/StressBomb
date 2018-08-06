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
    var containerSprite: [ContainerSprite] = []
    var square = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        square = self.childNode(withName: "Image") as! SKSpriteNode
        square.physicsBody?.affectedByGravity = true
        var numContainer = 0
        for row in 1...4{
            for col in 0...4{
                // Flags Controls
                containerSprite.append(ContainerSprite.init(numContainer: numContainer, row: row ,col: col ,inThisScene: self))
                numContainer += 1
            }
        }
        for container in 0...19{
            self.addChild(containerSprite[container].block)
            
        }
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


