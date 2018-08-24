//
//  Board.swift
//  StressBomb
//
//  Created by Heber Alejandro Solis Gurrola on 8/6/18.
//  Copyright © 2018 TeamLynx. All rights reserved.
//

import SpriteKit

class ContainerSprite{
    let block : SKSpriteNode!

    
    var containers = ["Container_Circle_Blue","Container_Hexagone_Blue","Container_Square_Blue","Container_Star_Blue","Container_Triangle_Blue",
                      "Container_Circle_DBlue","Container_Hexagone_DBlue","Container_Square_DBlue","Container_Star_DBlue","Container_Triangle_DBlue",
                      "Container_Circle_Green","Container_Hexagone_Green","Container_Square_Green","Container_Star_Green","Container_Triangle_Green",
                      "Container_Circle_Red","Container_Hexagone_Red","Container_Square_Red","Container_Star_Red","Container_Triangle_Red",
                      "Container_Circle_Yellow","Container_Hexagone_Yellow","Container_Square_Yellow","Container_Star_Yellow","Container_Triangle_Yellow"]

    
    init (numContainer: Int, row: Int, col: Int , inThisScene: GameScene) {

        block = SKSpriteNode(imageNamed: containers[numContainer])

        let numberOfBlocks = 12.5
        let blockScale = 0.6
        
        // Resizing depending to screen size
        
        let blockOriginalSize = block.size

        let blockWidth = block.size.width / 3.8
        let totalBlocksWidth = blockWidth * CGFloat(numberOfBlocks)
        let xOffset = (inThisScene.size.width - totalBlocksWidth) / 1.05
        let yOffset = (inThisScene.size.height - totalBlocksWidth) / 40
        
        //        block.position = CGPoint(x: (inThisScene.size.width * 0.225 * CGFloat(col)), y: (inThisScene.size.height * 0.825 * CGFloat(row)))
        
        block.position = CGPoint(x: xOffset + CGFloat( CGFloat(col) + 1) * (blockWidth * 1.450), y: yOffset + (inThisScene.size.height)  - ((block.size.height * 0.320) * CGFloat(row)) )
        
        block.size = CGSize(width:(block.size.width)*(inThisScene.size.width/block.size.width)/(11.42/1.5),  height: block.size.height * (inThisScene.size.height/block.size.height)/(6.42/1.5))
        block.physicsBody = SKPhysicsBody(rectangleOf: block.frame.size)
        block.physicsBody!.collisionBitMask = 0
        block.physicsBody?.affectedByGravity = false
        block.zPosition = 2
        block.physicsBody?.categoryBitMask = ColliderType.triangle_blue_container
        // block.physicsBody?.categoryBitMask = ColliderType.hexagone_green_container
        block.name = containers[numContainer]
        block.setScale(CGFloat (blockScale))
        
    }
}
