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
    static let star_blue: UInt32 = 31
    static let star_blue_container: UInt32 = 32
    
    static let star_dblue: UInt32 = 33
    static let star_dblue_container: UInt32 = 34
    
    static let star_green: UInt32 = 35
    static let star_green_container: UInt32 = 36
    
    static let star_red: UInt32 = 37
    static let star_red_container: UInt32 = 38
    
    static let star_yellow: UInt32 = 39
    static let star_yellow_container: UInt32 = 40
    
    static let triangle_blue: UInt32 = 41
    static let triangle_blue_container: UInt32 = 42
    
    static let triangle_dblue: UInt32 = 43
    static let triangle_dblue_container: UInt32 = 44
    
    static let triangle_green: UInt32 = 45
    static let triangle_green_container: UInt32 = 46
    
    static let triangle_red: UInt32 = 47
    static let triangle_red_container: UInt32 = 48
    
    static let triangle_yellow: UInt32 = 49
    static let triangle_yellow_container: UInt32 = 50
    
}



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    var containerSprite: [ContainerSprite] = []
    var containerPieces: [ContainerPieces] = []
    var square = SKSpriteNode()
    var square2 = SKSpriteNode()
    var circle = SKSpriteNode()
    
    var triangle_blue = SKSpriteNode()
    var triangle_dblue = SKSpriteNode()
    var triangle_green = SKSpriteNode()
    var triangle_red = SKSpriteNode()
    var triangle_yellow = SKSpriteNode()

    var star_blue = SKSpriteNode()
    var star_dblue = SKSpriteNode()
    var star_green = SKSpriteNode()
    var star_red = SKSpriteNode()
    var star_yellow = SKSpriteNode()
    
    var square_blue = SKSpriteNode()
    var square_dblue = SKSpriteNode()
    var square_green = SKSpriteNode()
    var square_red = SKSpriteNode()
    var square_yellow = SKSpriteNode()
    
    
    
    var figure_name_tb,figure_name_tdb,figure_name_tg,figure_name_tr, figure_name_ty, figure_name_sb,figure_name_sdb,figure_name_sg,figure_name_sr, figure_name_sy: String?
    
    var isFingerOnTriangleBlue = false
    var isFingerOnTriangleDBlue = false
    var isFingerOnTriangleGreen = false
    var isFingerOnTriangleRed = false
    var isFingerOnTriangleYellow = false
    var containerFull: [Int] = []
    //var figure_name: String?
    var firstBody = SKPhysicsBody()
    var secondBody = SKPhysicsBody()
    
    
    var isFingerOnStarBlue = false
    var isFingerOnStarDBlue = false
    var isFingerOnStarGreen = false
    var isFingerOnStarRed = false
    var isFingerOnStarYellow = false
    
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self

        //TRIANGULETES
        triangle_blue = SKSpriteNode(imageNamed: "FIgure_Triangle_Blue")
        triangle_blue.name = "Container_Triangle_Blue"
        triangle_blue.zPosition = 3
        triangle_blue.size = CGSize(width: 30, height: 30)
        triangle_blue.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 2)
        triangle_blue.physicsBody = SKPhysicsBody(rectangleOf: triangle_blue.frame.size)
        triangle_blue.physicsBody?.affectedByGravity = false
        triangle_blue.physicsBody?.isDynamic = false
        triangle_blue.physicsBody?.categoryBitMask = ColliderType.triangle_blue
       // triangle_blue.physicsBody!.collisionBitMask = 0
        triangle_blue.physicsBody?.collisionBitMask = ColliderType.triangle_blue_container
        triangle_blue.physicsBody?.contactTestBitMask = ColliderType.triangle_blue_container
        self.addChild(triangle_blue)
        
        
        triangle_dblue = SKSpriteNode(imageNamed: "Figure_Triangle_DBlue")
        triangle_dblue.name = "Container_Triangle_DBlue"
        triangle_dblue.zPosition = 3
        triangle_dblue.size = CGSize(width: 30, height: 30)
        triangle_dblue.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 2.4)
        
        triangle_dblue.physicsBody = SKPhysicsBody(rectangleOf: triangle_dblue.frame.size)
        triangle_dblue.physicsBody?.affectedByGravity = false
        triangle_dblue.physicsBody?.isDynamic = false
        triangle_dblue.physicsBody?.categoryBitMask = ColliderType.triangle_dblue
        // triangle_blue.physicsBody!.collisionBitMask = 0
        triangle_dblue.physicsBody?.collisionBitMask = ColliderType.triangle_dblue_container
        triangle_dblue.physicsBody?.contactTestBitMask = ColliderType.triangle_dblue_container
        self.addChild(triangle_dblue)
        
        triangle_green = SKSpriteNode(imageNamed: "FIgure_Triangle_Green")
        triangle_green.name = "Container_Triangle_Green"
        triangle_green.zPosition = 3
        triangle_green.size = CGSize(width: 30, height: 30)
        triangle_green.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 3)
        triangle_green.physicsBody = SKPhysicsBody(rectangleOf: triangle_dblue.frame.size)
        triangle_green.physicsBody?.affectedByGravity = false
        triangle_green.physicsBody?.isDynamic = false
        triangle_green.physicsBody?.categoryBitMask = ColliderType.triangle_green
        // triangle_blue.physicsBody!.collisionBitMask = 0
        triangle_green.physicsBody?.collisionBitMask = ColliderType.triangle_green_container
        triangle_green.physicsBody?.contactTestBitMask = ColliderType.triangle_green_container
        self.addChild(triangle_green)
        
        triangle_red = SKSpriteNode(imageNamed: "FIgure_Triangle_Red")
        triangle_red.name = "Container_Triangle_Red"
        triangle_red.zPosition = 3
        triangle_red.size = CGSize(width: 30, height: 30)
        triangle_red.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 4)
        triangle_red.physicsBody = SKPhysicsBody(rectangleOf: triangle_dblue.frame.size)
        triangle_red.physicsBody?.affectedByGravity = false
        triangle_red.physicsBody?.isDynamic = false
        triangle_red.physicsBody?.categoryBitMask = ColliderType.triangle_red
        // triangle_blue.physicsBody!.collisionBitMask = 0
        triangle_red.physicsBody?.collisionBitMask = ColliderType.triangle_red_container
        triangle_red.physicsBody?.contactTestBitMask = ColliderType.triangle_red_container
        self.addChild(triangle_red)
        
        triangle_yellow = SKSpriteNode(imageNamed: "FIgure_Triangle_Yellow")
        triangle_yellow.name = "Container_Triangle_Yellow"
        triangle_yellow.zPosition = 3
        triangle_yellow.size = CGSize(width: 30, height: 30)
        triangle_yellow.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 6)
        triangle_yellow.physicsBody = SKPhysicsBody(rectangleOf: triangle_dblue.frame.size)
        triangle_yellow.physicsBody?.affectedByGravity = false
        triangle_yellow.physicsBody?.isDynamic = false
        triangle_yellow.physicsBody?.categoryBitMask = ColliderType.triangle_yellow
        // triangle_blue.physicsBody!.collisionBitMask = 0
        triangle_yellow.physicsBody?.collisionBitMask = ColliderType.triangle_yellow_container
        triangle_yellow.physicsBody?.contactTestBitMask = ColliderType.triangle_yellow_container
        self.addChild(triangle_yellow)
        
        
        //ESTRELLINES
        star_blue = SKSpriteNode(imageNamed: "FIgure_Star_Blue")
        star_blue.name = "Container_Star_Blue"
        star_blue.zPosition = 3
        star_blue.size = CGSize(width: 30, height: 30)
        star_blue.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 2)
        star_blue.physicsBody = SKPhysicsBody(rectangleOf: star_blue.frame.size)
        star_blue.physicsBody?.affectedByGravity = false
        star_blue.physicsBody?.isDynamic = false
        star_blue.physicsBody?.categoryBitMask = ColliderType.star_blue
        // triangle_blue.physicsBody!.collisionBitMask = 0
        star_blue.physicsBody?.collisionBitMask = ColliderType.star_blue_container
        star_blue.physicsBody?.contactTestBitMask = ColliderType.star_blue_container
        self.addChild(star_blue)
        
        
        star_dblue = SKSpriteNode(imageNamed: "FIgure_Star_DBlue")
        star_dblue.name = "Container_Star_DBlue"
        star_dblue.zPosition = 3
        star_dblue.size = CGSize(width: 30, height: 30)
        star_dblue.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 2.4)
        star_dblue.physicsBody = SKPhysicsBody(rectangleOf: triangle_dblue.frame.size)
        star_dblue.physicsBody?.affectedByGravity = false
        star_dblue.physicsBody?.isDynamic = false
        star_dblue.physicsBody?.categoryBitMask = ColliderType.star_dblue
        // triangle_blue.physicsBody!.collisionBitMask = 0
        star_dblue.physicsBody?.collisionBitMask = ColliderType.star_dblue_container
        star_dblue.physicsBody?.contactTestBitMask = ColliderType.star_dblue_container
        self.addChild(star_dblue)
        
        star_green = SKSpriteNode(imageNamed: "FIgure_Star_Green")
        star_green.name = "Container_Star_Green"
        star_green.zPosition = 3
        star_green.size = CGSize(width: 30, height: 30)
        star_green.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 3)
        star_green.physicsBody = SKPhysicsBody(rectangleOf: star_green.frame.size)
        star_green.physicsBody?.affectedByGravity = false
        star_green.physicsBody?.isDynamic = false
        star_green.physicsBody?.categoryBitMask = ColliderType.star_green
        // triangle_blue.physicsBody!.collisionBitMask = 0
        star_green.physicsBody?.collisionBitMask = ColliderType.star_green_container
        star_green.physicsBody?.contactTestBitMask = ColliderType.star_green_container
        self.addChild(star_green)
        
        star_red = SKSpriteNode(imageNamed: "FIgure_Star_Red")
        star_red.name = "Container_Star_Red"
        star_red.zPosition = 3
        star_red.size = CGSize(width: 30, height: 30)
        star_red.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 4)
        star_red.physicsBody = SKPhysicsBody(rectangleOf: star_red.frame.size)
        star_red.physicsBody?.affectedByGravity = false
        star_red.physicsBody?.isDynamic = false
        star_red.physicsBody?.categoryBitMask = ColliderType.star_red
        // triangle_blue.physicsBody!.collisionBitMask = 0
        star_red.physicsBody?.collisionBitMask = ColliderType.star_red_container
        star_red.physicsBody?.contactTestBitMask = ColliderType.star_red_container
        self.addChild(star_red)
        
        star_yellow = SKSpriteNode(imageNamed: "FIgure_Star_Yellow")
        star_yellow.name = "Container_Star_Yellow"
        star_yellow.zPosition = 3
        star_yellow.size = CGSize(width: 30, height: 30)
        star_yellow.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 6)
        star_yellow.physicsBody = SKPhysicsBody(rectangleOf: star_yellow.frame.size)
        star_yellow.physicsBody?.affectedByGravity = false
        star_yellow.physicsBody?.isDynamic = false
        star_yellow.physicsBody?.categoryBitMask = ColliderType.star_yellow
        // triangle_blue.physicsBody!.collisionBitMask = 0
        star_yellow.physicsBody?.collisionBitMask = ColliderType.star_yellow_container
        star_yellow.physicsBody?.contactTestBitMask = ColliderType.star_yellow_container
        self.addChild(star_yellow)
        

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
        
     //   print(containerSprite[2].block.name?.hasPrefix("Square"))
        
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
        
        figure_name_tb = "Container_Triangle_Blue"
        figure_name_tdb = "Container_Triangle_DBlue"
        figure_name_tg = "Container_Triangle_Green"
        figure_name_tr = "Container_Triangle_Red"
        figure_name_ty = "Container_Triangle_Yellow"
        
        
        figure_name_sb = "Container_Star_Blue"
        figure_name_sdb = "Container_Star_DBlue"
        figure_name_sg = "Container_Star_Green"
        figure_name_sr = "Container_Star_Red"
        figure_name_sy = "Container_Star_Yellow"
        
        //TRIANGULETES
        if firstBody.node?.name == "Container_Triangle_Blue" && secondBody.node?.name == figure_name_tb {
            print("Contact detected")
            containerSprite[4].block.texture = SKTexture(imageNamed: "Triangle_Blue_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_blue.isHidden = true
            triangle_blue.physicsBody = nil
            //print("Array", containerSprite[4].block.name)
            //print("Figura", square.name)
        }else{
             triangle_blue.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 2)
            //print("fIRST BODY", firstBody.node?.name)
            //print("eCOND Body", secondBody.node?.name)
        }
        
        if firstBody.node?.name == "Container_Triangle_DBlue" && secondBody.node?.name == figure_name_tdb {
            print("Contact detected")
            containerSprite[9].block.texture = SKTexture(imageNamed: "Triangle_DBlue_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_dblue.isHidden = true
            triangle_dblue.physicsBody = nil
            //print("Array", containerSprite[4].block.name)
           // print("Figura", square.name)
        }else{
            triangle_dblue.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 2.4)
           // print("fIRST BODY", firstBody.node?.name)
            //print("eCOND Body", secondBody.node?.name)
        }
        
        if firstBody.node?.name == "Container_Triangle_Green" && secondBody.node?.name == figure_name_tg {
            print("Contact detected")
            containerSprite[14].block.texture = SKTexture(imageNamed: "Triangle_Green_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_green.isHidden = true
            triangle_green.physicsBody = nil
            print("Array", containerSprite[14].block.name)
            print("Figura", triangle_green.name)
        }else{
              triangle_green.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 3)
           // print("fIRST BODY", firstBody.node?.name)
           // print("eCOND Body", secondBody.node?.name)
        }
        
        if firstBody.node?.name == "Container_Triangle_Red" && secondBody.node?.name == figure_name_tr {
            print("Contact detected")
            containerSprite[19].block.texture = SKTexture(imageNamed: "Triangle_Red_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_red.isHidden = true
            triangle_red.physicsBody = nil
            //print("Array", containerSprite[4].block.name)
            // print("Figura", square.name)
        }else{
            triangle_red.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 4)
            // print("fIRST BODY", firstBody.node?.name)
            // print("eCOND Body", secondBody.node?.name)
        }
        
        if firstBody.node?.name == "Container_Triangle_Yellow" && secondBody.node?.name == figure_name_ty {
            print("Contact detected")
            containerSprite[24].block.texture = SKTexture(imageNamed: "Triangle_Yellow_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_yellow.isHidden = true
            triangle_yellow.physicsBody = nil
            //print("Array", containerSprite[4].block.name)
            // print("Figura", square.name)
        }else{
            triangle_yellow.position = CGPoint(x: self.frame.size.width / 1.1, y: self.frame.size.width / 6)
            // print("fIRST BODY", firstBody.node?.name)
            // print("eCOND Body", secondBody.node?.name)
        }
        
        
        //ESTRELLINES
        if firstBody.node?.name == "Container_Star_Blue" && secondBody.node?.name == figure_name_sb {
            print("Contact detected")
            containerSprite[3].block.texture = SKTexture(imageNamed: "Star_Blue_Filled")
            //print("Contact happened between square 1 and square 2")
            star_blue.isHidden = true
            star_blue.physicsBody = nil

        }else{
            star_blue.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 2)
        }
        
        if firstBody.node?.name == "Container_Star_DBlue" && secondBody.node?.name == figure_name_sdb {
            print("Contact detected")
            containerSprite[8].block.texture = SKTexture(imageNamed: "Star_DBlue_Filled")
            //print("Contact happened between square 1 and square 2")
            star_dblue.isHidden = true
            star_dblue.physicsBody = nil

        }else{
            star_dblue.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 2.4)
        }
        
        if firstBody.node?.name == "Container_Star_Green" && secondBody.node?.name == figure_name_sg {
            print("Contact detected")
            containerSprite[13].block.texture = SKTexture(imageNamed: "Star_Green_Filled")
            //print("Contact happened between square 1 and square 2")
            star_green.isHidden = true
            star_green.physicsBody = nil

        }else{
            star_green.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 3)
        }
        
        if firstBody.node?.name == "Container_Star_Red" && secondBody.node?.name == figure_name_sr {
            print("Contact detected")
            containerSprite[18].block.texture = SKTexture(imageNamed: "Star_Red_Filled")
            //print("Contact happened between square 1 and square 2")
            star_red.isHidden = true
            star_red.physicsBody = nil

        }else{
            star_red.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 4)
        }
        
        if firstBody.node?.name == "Container_Star_Yellow" && secondBody.node?.name == figure_name_sy {
            print("Contact detected")
            containerSprite[23].block.texture = SKTexture(imageNamed: "Star_Yellow_Filled")
            //print("Contact happened between square 1 and square 2")
            star_yellow.isHidden = true
            star_yellow.physicsBody = nil

        }else{
            star_yellow.position = CGPoint(x: self.frame.size.width / 1.2, y: self.frame.size.width / 6)

        }
        
        
    }

    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //TRIANGULETES
        for touch in touches {
            let location = touch.location(in: self)
            if triangle_blue.frame.contains(location) {
                triangle_blue.position = location
                triangle_blue.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnTriangleBlue = true
                print("Blue triangle")
                
                
                
            }
        }
        
        for touch in touches {
            let location = touch.location(in: self)
            if triangle_dblue.frame.contains(location) {
                triangle_dblue.position = location
                triangle_dblue.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnTriangleDBlue = true
                print("Deep blue triangle")

            }
        }
        
        
        for touch in touches {
            let location = touch.location(in: self)
            if triangle_green.frame.contains(location) {
                triangle_green.position = location
                triangle_green.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnTriangleGreen = true
                print("Green triangle")
                
            }
        }
        
        for touch in touches {
            let location = touch.location(in: self)
            if triangle_red.frame.contains(location) {
                triangle_red.position = location
                triangle_red.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnTriangleRed = true
                print("Red triangle")
                
            }
        }
        
        for touch in touches {
            let location = touch.location(in: self)
            if triangle_yellow.frame.contains(location) {
                triangle_yellow.position = location
                triangle_yellow.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnTriangleYellow = true
                print("Yellow triangle")
                
            }
        }
        
        //ESTRELLINES
        for touch in touches {
            let location = touch.location(in: self)
            if star_blue.frame.contains(location) {
                star_blue.position = location
                star_blue.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnStarBlue = true
                print("Blue Star")
                
                
                
            }
        }
        
        for touch in touches {
            let location = touch.location(in: self)
            if star_dblue.frame.contains(location) {
                star_dblue.position = location
                star_dblue.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnStarDBlue = true
                print("Deep blue Star")
                
            }
        }
        
        
        for touch in touches {
            let location = touch.location(in: self)
            if star_green.frame.contains(location) {
                star_green.position = location
                star_green.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnStarGreen = true
                print("Green Star")
                
            }
        }
        
        for touch in touches {
            let location = touch.location(in: self)
            if star_red.frame.contains(location) {
                star_red.position = location
                star_red.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnStarRed = true
                print("Red Star")
                
            }
        }
        
        for touch in touches {
            let location = touch.location(in: self)
            if star_yellow.frame.contains(location) {
                star_yellow.position = location
                star_yellow.run(blinkAnimation(), withKey:"wiggle")
                isFingerOnStarYellow = true
                print("Yellow Star")
                
            }
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Trianguletes
        if isFingerOnTriangleBlue {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = triangle_blue.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = triangle_blue.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, triangle_blue.size.width/2)
            paddleX = min(paddleX, size.width - triangle_blue.size.width/2)
            
            paddleY = max(paddleY, triangle_blue.size.width/2)
            paddleY = min(paddleY, size.width - triangle_blue.size.width/2)
            
            triangle_blue.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
        if isFingerOnTriangleDBlue {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = triangle_dblue.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = triangle_dblue.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, triangle_dblue.size.width/2)
            paddleX = min(paddleX, size.width - triangle_dblue.size.width/2)
            
            paddleY = max(paddleY, triangle_dblue.size.width/2)
            paddleY = min(paddleY, size.width - triangle_dblue.size.width/2)
            
            triangle_dblue.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        if isFingerOnTriangleGreen {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = triangle_green.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = triangle_green.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, triangle_green.size.width/2)
            paddleX = min(paddleX, size.width - triangle_green.size.width/2)
            
            paddleY = max(paddleY, triangle_green.size.width/2)
            paddleY = min(paddleY, size.width - triangle_green.size.width/2)
            
            triangle_green.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        if isFingerOnTriangleRed {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = triangle_red.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = triangle_red.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, triangle_red.size.width/2)
            paddleX = min(paddleX, size.width - triangle_red.size.width/2)
            
            paddleY = max(paddleY, triangle_red.size.width/2)
            paddleY = min(paddleY, size.width - triangle_red.size.width/2)
            
            triangle_red.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
        if isFingerOnTriangleYellow {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = triangle_yellow.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = triangle_yellow.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, triangle_yellow.size.width/2)
            paddleX = min(paddleX, size.width - triangle_yellow.size.width/2)
            
            paddleY = max(paddleY, triangle_yellow.size.width/2)
            paddleY = min(paddleY, size.width - triangle_yellow.size.width/2)
            
            triangle_yellow.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        //ESTRELLINES
        if isFingerOnStarBlue {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = star_blue.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = star_blue.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, star_blue.size.width/2)
            paddleX = min(paddleX, size.width - star_blue.size.width/2)
            
            paddleY = max(paddleY, star_blue.size.width/2)
            paddleY = min(paddleY, size.width - star_blue.size.width/2)
            
            star_blue.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
        if isFingerOnStarDBlue {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = star_dblue.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = star_dblue.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, star_dblue.size.width/2)
            paddleX = min(paddleX, size.width - star_dblue.size.width/2)
            
            paddleY = max(paddleY, star_dblue.size.width/2)
            paddleY = min(paddleY, size.width - star_dblue.size.width/2)
            
            star_dblue.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        if isFingerOnStarGreen {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = star_green.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = star_green.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, star_green.size.width/2)
            paddleX = min(paddleX, size.width - star_green.size.width/2)
            
            paddleY = max(paddleY, star_green.size.width/2)
            paddleY = min(paddleY, size.width - star_green.size.width/2)
            
            star_green.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        if isFingerOnStarRed {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = star_red.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = star_red.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, star_red.size.width/2)
            paddleX = min(paddleX, size.width - star_red.size.width/2)
            
            paddleY = max(paddleY, star_red.size.width/2)
            paddleY = min(paddleY, size.width - star_red.size.width/2)
            
            star_red.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
        if isFingerOnStarYellow {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = star_yellow.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = star_yellow.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, star_yellow.size.width/2)
            paddleX = min(paddleX, size.width - star_yellow.size.width/2)
            
            paddleY = max(paddleY, star_yellow.size.width/2)
            paddleY = min(paddleY, size.width - star_yellow.size.width/2)
            
            star_yellow.position = CGPoint(x: paddleX, y: paddleY)
            
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
        
        isFingerOnTriangleBlue = false
        isFingerOnTriangleDBlue = false
        isFingerOnTriangleGreen = false
        isFingerOnTriangleRed = false
        isFingerOnTriangleYellow = false
        
        isFingerOnStarBlue = false
        isFingerOnStarDBlue = false
        isFingerOnStarGreen = false
        isFingerOnStarRed = false
        isFingerOnStarYellow = false
        
        triangle_blue.removeAction(forKey: "wiggle")
        triangle_blue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        triangle_dblue.removeAction(forKey: "wiggle")
        triangle_dblue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        triangle_green.removeAction(forKey: "wiggle")
        triangle_green.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        triangle_red.removeAction(forKey: "wiggle")
        triangle_red.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        triangle_yellow.removeAction(forKey: "wiggle")
        triangle_yellow.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        
        
        star_blue.removeAction(forKey: "wiggle")
        star_blue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        star_dblue.removeAction(forKey: "wiggle")
        star_dblue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        star_green.removeAction(forKey: "wiggle")
        star_green.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        star_red.removeAction(forKey: "wiggle")
        star_red.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        star_yellow.removeAction(forKey: "wiggle")
        star_yellow.run(SKAction.rotate(toAngle: 0, duration: 0.2))
    }
    
}
