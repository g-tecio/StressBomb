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
    var circle = SKSpriteNode()
    var isFingerOnPaddle = false
    
    override func didMove(to view: SKView) {
        

        
        square = self.childNode(withName: "square") as! SKSpriteNode
        square.texture = SKTexture(imageNamed: "Square_figure_1")
        square.physicsBody?.affectedByGravity = true
        square.zPosition = 3
        square.anchorPoint.y = -0.7

    
        var numContainer = 0
        for row in 1...5{
            for col in 0...4{
                // Flags Controls
                containerSprite.append(ContainerSprite.init(numContainer: numContainer, row: row ,col: col ,inThisScene: self))
                numContainer += 1
            }
        }
        for container in 0...24{
            self.addChild(containerSprite[container].block)
            
        }
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if square.frame.contains(location) {
                square.position = location
                square.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnPaddle = true
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isFingerOnPaddle {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = square.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = square.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, square.size.width/2)
            paddleX = min(paddleX, size.width - square.size.width/2)
            
            paddleY = max(paddleY, square.size.width/2)
            paddleY = min(paddleY, size.width - square.size.width/2)
            
            square.position = CGPoint(x: paddleX, y: paddleY)
            
        }
    }
    func blinkAnimation() -> SKAction{
        let duration = 0.2
        let fadeOut = SKAction.rotate(toAngle: 0.15, duration: duration)
        let fadeIn = SKAction.rotate(toAngle: -0.15, duration: duration)
        let blink = SKAction.sequence([fadeOut, fadeIn])
        
        return SKAction.repeatForever(blink)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnPaddle = false
        square.removeAction(forKey: "wiggle")
        square.run(SKAction.rotate(toAngle: 0, duration: 0.2))
    }
    
}
