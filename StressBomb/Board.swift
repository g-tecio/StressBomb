//
//  Board.swift
//  StressBomb
//
//  Created by Heber Alejandro Solis Gurrola on 8/6/18.
//  Copyright © 2018 TeamLynx. All rights reserved.
//

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change Int in the next line to IndexDistance in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

import SpriteKit

struct ContainerSprite{
        let block : SKSpriteNode!
        let block2 : SKSpriteNode!
    
    let containers = ["Circle_container_1","Moon_container_1","Square_container_1","Star_container_1","Triangle_container_1","Circle_container_2","Moon_container_2","Square_container_2","Star_container_2","Triangle_container_2","Circle_container_3","Moon_container_3","Square_container_3","Star_container_3","Triangle_container_3","Circle_container_4","Moon_container_4","Square_container_4","Star_container_4","Triangle_container_4","Circle_container_5","Moon_container_5","Square_container_5","Star_container_5","Triangle_container_5"].shuffled()
    
    
    
    
    init (numContainer: Int, row: Int, col: Int , inThisScene: GameScene) {
        
        block = SKSpriteNode(imageNamed: containers[numContainer])
        block2 = SKSpriteNode(imageNamed: containers[1])
        let numberOfBlocks = 10.5
        let blockScale = 0.5
       
        // Resizing depending to screen size
        
        let blockOriginalSize = block.size
      
        
       // let blockWidth = block.size.width / 0.9
       
       
        
        let blockWidth = block.size.width / 1.9
        let totalBlocksWidth = blockWidth * CGFloat(numberOfBlocks)
        let xOffset = (inThisScene.size.width - totalBlocksWidth) / 2.70
        
//        block.position = CGPoint(x: (inThisScene.size.width * 0.225 * CGFloat(col)), y: (inThisScene.size.height * 0.825 * CGFloat(row)))
        
        block.position = CGPoint(x: xOffset + CGFloat( CGFloat(col) + 1) * (blockWidth * 1.480), y: (inThisScene.size.height * 1) - ((block.size.height * 0.780) * CGFloat(row)))
        block.physicsBody = SKPhysicsBody(rectangleOf: block.frame.size)
        block.physicsBody!.allowsRotation = false
        block.physicsBody!.friction = 0.0
        block.physicsBody!.affectedByGravity = false
        block.physicsBody!.isDynamic = false
        block.zPosition = 2
        block.setScale(CGFloat (blockScale))
        
    }
}
