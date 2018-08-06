//
//  Board.swift
//  StressBomb
//
//  Created by Heber Alejandro Solis Gurrola on 8/6/18.
//  Copyright © 2018 TeamLynx. All rights reserved.
//

import SpriteKit

struct ContainerSprite{
        let block : SKSpriteNode!
    
    let containers = ["Circle_container_1","Moon_container_1","Square_container_1","Star_container_1","Triangle_container_1","Circle_container_2","Moon_container_2","Square_container_2","Star_container_2","Triangle_container_2","Circle_container_3","Moon_container_3","Square_container_3","Star_container_3","Triangle_container_3","Circle_container_4","Moon_container_4","Square_container_4","Star_container_4","Triangle_container_4"]
    
    init (numContainer: Int, row: Int, col: Int , inThisScene: GameScene) {
        
        block = SKSpriteNode(imageNamed: containers[numContainer])
        let numberOfBlocks = 11.25
        let blockScale = 0.5
        
        // Resizing depending to screen size
        
        let blockOriginalSize = block.size
      
        
       // let blockWidth = block.size.width / 0.9
       
       
        
        let blockWidth = block.size.width / 1.9
        let totalBlocksWidth = blockWidth * CGFloat(numberOfBlocks)
        let xOffset = (inThisScene.size.width - totalBlocksWidth) / 2
        
//        block.position = CGPoint(x: (inThisScene.size.width * 0.225 * CGFloat(col)), y: (inThisScene.size.height * 0.825 * CGFloat(row)))
        
        block.position = CGPoint(x: xOffset + CGFloat( CGFloat(col) + 1) * (blockWidth * 1), y: (inThisScene.size.height * 1.09) - ((block.size.height * 1) * CGFloat(row)))
        block.physicsBody = SKPhysicsBody(rectangleOf: block.frame.size)
        block.physicsBody!.allowsRotation = false
        block.physicsBody!.friction = 0.0
        block.physicsBody!.affectedByGravity = false
        block.physicsBody!.isDynamic = false
        block.zPosition = 2
        block.setScale(CGFloat (blockScale))
        
    }
}
