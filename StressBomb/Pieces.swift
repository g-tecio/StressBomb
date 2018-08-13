//
//  Pieces.swift
//  StressBomb
//
//  Created by Heber Alejandro Solis Gurrola on 8/9/18.
//  Copyright © 2018 TeamLynx. All rights reserved.
//



import SpriteKit

struct ContainerPieces{
    let block : SKSpriteNode!
    
    let pieces = ["Circle_figure_1","Moon_figure_1","Square_figure_1","Star_figure_1","Triangle_figure_1","Circle_figure_2","Moon_figure_2","Square_figure_2","Star_figure_2","Triangle_figure_2","Circle_figure_3","Moon_figure_3","Square_figure_3","Star_figure_3","Triangle_figure_3","Circle_figure_4","Moon_figure_4","Square_figure_4","Star_figure_4","Triangle_figure_4","Circle_figure_5","Moon_figure_5","Square_figure_5","Star_figure_5","Triangle_figure_5"].shuffled()
    
    init (numContainer: Int, row: Int, col: Int , inThisScene: GameScene) {
        
        block = SKSpriteNode(imageNamed: pieces[numContainer])
        let numberOfBlocks = 10.5
        let blockScale = 0.5
        
        // Resizing depending to screen size
        
        let blockOriginalSize = block.size
        
        let blockWidth = block.size.width / 1
        let totalBlocksWidth = blockWidth * CGFloat(numberOfBlocks)
        //let xOffset = (inThisScene.size.width - totalBlocksWidth)/2
        
        
        block.position = CGPoint(x: (inThisScene.size.width / 1.1), y: (inThisScene.size.height / 2))
        block.physicsBody = SKPhysicsBody(rectangleOf: block.frame.size)
        block.physicsBody!.collisionBitMask = 0
        block.physicsBody?.affectedByGravity = false
        block.zPosition = 2
      //  block.physicsBody?.categoryBitMask = ColliderType.containerSprite
        block.name = pieces[numContainer]
        block.setScale(CGFloat (blockScale))
        
    }
}
