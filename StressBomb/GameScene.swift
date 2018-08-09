//
//  GameScene.swift
//  StressBomb
//
//  Created by Herbeyg Robledo Reyes on 8/3/18.
//  Copyright © 2018 TeamLynx. All rights reserved.
//

import SpriteKit
import GameplayKit

struct ColliderType {
    static let square: UInt32 = 1
    static let containerSprite: UInt32 = 2
    
}



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    var containerSprite: [ContainerSprite] = []
    var containerPieces: [ContainerPieces] = []
    var square = SKSpriteNode()
    var square2 = SKSpriteNode()
    var circle = SKSpriteNode()
    var isFingerOnPaddle = false
    var containerFull: [Int] = []
    var figure_name: String?
    var firstBody = SKPhysicsBody()
    var secondBody = SKPhysicsBody()
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        square = self.childNode(withName: "square") as! SKSpriteNode
        square.name = "Square_container_2"
        square.texture = SKTexture(imageNamed: "Square_figure_1")
        square.zPosition = 3
        square.anchorPoint.y = -0.7
        //PhysicBody for the square 1
        square.physicsBody = SKPhysicsBody(rectangleOf: square.frame.size)
        square.physicsBody?.affectedByGravity = false
        square.physicsBody?.isDynamic = false
        square.physicsBody?.categoryBitMask = ColliderType.square
        square.physicsBody!.collisionBitMask = 0
        square.physicsBody?.collisionBitMask = ColliderType.containerSprite
        square.physicsBody?.contactTestBitMask = ColliderType.containerSprite
        
        //        square2 = self.childNode(withName: "square2") as! SKSpriteNode
        //        //square2.name = "square2"
        //        square2.texture = SKTexture(imageNamed: "Square_figure_1")
        //        square2.zPosition = 2
        //
        //        //PhysicBody for the square 2
        //        square2.physicsBody = SKPhysicsBody(rectangleOf: square.frame.size)
        //        //  square2.physicsBody = SKPhysicsBody(rectangleOf: square.size.height / 2)
        //        square2.physicsBody!.collisionBitMask = 0
        //        square2.physicsBody?.affectedByGravity = false
        //        square2.physicsBody?.categoryBitMask = ColliderType.containerSprite
        
        
        
        
        
        
        //square.intersects(square2)
        
        
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
        
        
        var numContainerPieces = 0
        for row in 1...5{
            for col in 0...4{
                // Flags Controls
                containerPieces.append(ContainerPieces.init(numContainer: numContainerPieces, row: row ,col: col ,inThisScene: self))
                numContainerPieces += 1
            }
        }
        for container in 0...24{
            self.addChild(containerPieces[container].block)
            
        }
        
        print(containerSprite[2].block.name?.hasPrefix("Square"))
        
        //figure_name = containerSprite[2].block.name
        
    }
    
    
    
    //    func comparar(){
    //        if square.texture?.description == square2.texture?.description {
    //            print("Yes the same")
    //        }
    //        else{
    //            print(square.texture)
    //        }
    //    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        if contact.bodyA.node?.name == "square"{
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
    }
    //7
    //12
    //17
    //22
    
    func Checar(){
        
        figure_name = "Square_container_2"
        if firstBody.node?.name == "Square_container_2" && secondBody.node?.name == figure_name {
            print("Contact detected")
            containerSprite[7].block.texture = SKTexture(imageNamed: "Square_fill_1")
            //print("Contact happened between square 1 and square 2")
            square.isHidden = true
            square.physicsBody = nil
            print("Array", containerSprite[2].block.name)
            print("Figura", square.name)
        }else{
            
            print("fIRST BODY", firstBody.node?.name)
            print("eCOND Body", secondBody.node?.name)
        }
        
        
    }
    
    //    func didBeginContact(contact: SKPhysicsContact) {
    //        print("Entro al metodo")
    //        if square2.texture == SKTexture(imageNamed: "Square_figure_1") {
    //            print("Simón si es")
    //        } else {
    //            print("Nel no es")
    //        }
    //    }
    
    
    //    func didBegin(_ contact: SKPhysicsContact) {
    //        if contact.bodyA.node?.name == "square" {
    //            print("Si sirve")
    //        }
    //    }
    
    
    
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
        let fadeOut = SKAction.rotate(toAngle: 0.09, duration: duration)
        let fadeIn = SKAction.rotate(toAngle: -0.09, duration: duration)
        let blink = SKAction.sequence([fadeOut, fadeIn])
        
        return SKAction.repeatForever(blink)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        Checar()
        
        isFingerOnPaddle = false
        square.removeAction(forKey: "wiggle")
        square.run(SKAction.rotate(toAngle: 0, duration: 0.2))
    }
    
}
