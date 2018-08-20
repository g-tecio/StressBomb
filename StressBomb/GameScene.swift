//
//  GameScene.swift
//  StressBomb
//
//  Created by Herbeyg Robledo Reyes on 8/3/18.
//  Copyright © 2018 TeamLynx. All rights reserved.
//
extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        
        return self[index]
    }
}

extension Array {
    /// Returns an array containing this sequence shuffled
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    /// Shuffles this sequence in place
    @discardableResult
    mutating func shuffle() -> Array {
        let count = self.count
        indices.lazy.dropLast().forEach {
            swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
        }
        return self
    }
    var chooseOne: Element { return self[Int(arc4random_uniform(UInt32(count)))] }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}



import SpriteKit
import GameplayKit

struct ColliderType {
    
    static let circle_blue: UInt32 = 1
    static let circle_blue_container: UInt32 = 2
    
    static let circle_dblue: UInt32 = 1
    static let circle_dblue_container: UInt32 = 2
    
    static let circle_green: UInt32 = 1
    static let circle_green_container: UInt32 = 2
    
    static let circle_red: UInt32 = 1
    static let circle_red_container: UInt32 = 2
    
    static let circle_yellow: UInt32 = 1
    static let circle_yellow_container: UInt32 = 2
    
    
    static let hexagone_blue: UInt32 = 1
    static let hexagone_blue_container: UInt32 = 2
    
    static let hexagone_dblue: UInt32 = 1
    static let hexagone_dblue_container: UInt32 = 2
    
    static let hexagone_green: UInt32 = 1
    static let hexagone_green_container: UInt32 = 2
    
    static let hexagone_red: UInt32 = 1
    static let hexagone_red_container: UInt32 = 2
    
    static let hexagone_yellow: UInt32 = 1
    static let hexagone_yellow_container: UInt32 = 2
    
    
    static let square_blue: UInt32 = 1
    static let square_blue_container: UInt32 = 2
    
    static let square_dblue: UInt32 = 1
    static let square_dblue_container: UInt32 = 2
    
    static let square_green: UInt32 = 1
    static let square_green_container: UInt32 = 2
    
    static let square_red: UInt32 = 1
    static let square_red_container: UInt32 = 2
    
    static let square_yellow: UInt32 = 1
    static let square_yellow_container: UInt32 = 2
    
    
    static let star_blue: UInt32 = 1
    static let star_blue_container: UInt32 = 2
    
    static let star_dblue: UInt32 = 1
    static let star_dblue_container: UInt32 = 2
    
    static let star_green: UInt32 = 1
    static let star_green_container: UInt32 = 2
    
    static let star_red: UInt32 = 1
    static let star_red_container: UInt32 = 2
    
    static let star_yellow: UInt32 = 1
    static let star_yellow_container: UInt32 = 2
    
    
    static let triangle_blue: UInt32 = 1
    static let triangle_blue_container: UInt32 = 2
    
    static let triangle_dblue: UInt32 = 1
    
    static let triangle_dblue_container: UInt32 = 2
    
    static let triangle_green: UInt32 = 1
    static let triangle_green_container: UInt32 = 2
    
    static let triangle_red: UInt32 = 1
    static let triangle_red_container: UInt32 = 2
    
    static let triangle_yellow: UInt32 = 1
    static let triangle_yellow_container: UInt32 = 2
    
}



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    var containerSprite: [ContainerSprite] = []
    var containerPieces: [ContainerPieces] = []
    
    var labelWin: SKLabelNode!
    
    var labelTimesUp: SKLabelNode!
    
    var timerBase = SKSpriteNode()
    var timerNeedle = SKSpriteNode()
    var bin = SKSpriteNode()
    var binEmpty = SKSpriteNode()
    var blackScreen = SKSpriteNode()
    var happyFace = SKSpriteNode()
    var sadFace = SKSpriteNode()
    
    var circle_blue = SKSpriteNode()
    var circle_dblue = SKSpriteNode()
    var circle_green = SKSpriteNode()
    var circle_red = SKSpriteNode()
    var circle_yellow = SKSpriteNode()
    
    var triangle_blue = SKSpriteNode()
    var triangle_dblue = SKSpriteNode()
    var triangle_green = SKSpriteNode()
    var triangle_red = SKSpriteNode()
    var triangle_yellow = SKSpriteNode()
    var clicked:Bool = false
    var start:Bool = false
    
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
    
    var hexagone_blue = SKSpriteNode()
    var hexagone_dblue = SKSpriteNode()
    var hexagone_green = SKSpriteNode()
    var hexagone_red = SKSpriteNode()
    var hexagone_yellow = SKSpriteNode()
    var background = SKSpriteNode()
    
    
    
    var arraySprites: [SKSpriteNode] = [SKSpriteNode]()
    
    
    var figure_name_cb,figure_name_cdb,figure_name_cg,figure_name_cr, figure_name_cy,
    figure_name_hb,figure_name_hdb,figure_name_hg,figure_name_hr, figure_name_hy,
    figure_name_sqb,figure_name_sqdb,figure_name_sqg,figure_name_sqr, figure_name_sqy,
    figure_name_tb,figure_name_tdb,figure_name_tg,figure_name_tr, figure_name_ty,
    figure_name_sb,figure_name_sdb,figure_name_sg,figure_name_sr, figure_name_sy: String?
    
    var isFingerOnTriangleBlue = false
    var isFingerOnTriangleDBlue = false
    var isFingerOnTriangleGreen = false
    var isFingerOnTriangleRed = false
    var isFingerOnTriangleYellow = false
    
    var isFingerOnCircleBlue = false
    var isFingerOnCircleDBlue = false
    var isFingerOnCircleGreen = false
    var isFingerOnCircleRed = false
    var isFingerOnCircleYellow = false
    
    var myRandomItem: SKSpriteNode = SKSpriteNode()
    var index = 0
    var indexContainer = 0
    var containerFull: [Int] = []
    //var figure_name: String?
    var firstBody = SKPhysicsBody()
    var secondBody = SKPhysicsBody()
    
    var firstBodyHexa = SKPhysicsBody()
    var secondBodyHexa = SKPhysicsBody()
    
    var isFingerOnStarBlue = false
    var isFingerOnStarDBlue = false
    var isFingerOnStarGreen = false
    var isFingerOnStarRed = false
    var isFingerOnStarYellow = false
    
    var isFingerOnSquareBlue = false
    var isFingerOnSquareDBlue = false
    var isFingerOnSquareGreen = false
    var isFingerOnSquareRed = false
    var isFingerOnSquareYellow = false
    
    var isFingerOnHexagoneBlue = false
    var isFingerOnHexagoneDBlue = false
    var isFingerOnHexagoneGreen = false
    var isFingerOnHexagoneRed = false
    var isFingerOnHexagoneYellow = false
    
    
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        background = SKSpriteNode(imageNamed: "Background")
        background.size = CGSize(width: (frame.size.width),  height: frame.size.height)
        background.position = CGPoint(x: (frame.size.width/2), y: frame.size.height/2)
        print("FRAME SIZE WIDTH", frame.size.width)
        print("FRAME SIZE Height", frame.size.height)
        
        self.addChild(background)
        //Timer
        timerBase = SKSpriteNode(imageNamed: "Timer_Base")
        timerBase.zPosition = 4
        timerBase.size = CGSize(width: 90, height: 90)
        timerBase.position = CGPoint(x: self.frame.size.width / 1.150, y: self.frame.size.width / 2.3)
        self.addChild(timerBase)
        
        //Timer Neddle
        timerNeedle = SKSpriteNode(imageNamed: "Timer_Needle")
        timerNeedle.zPosition = 5
        //timerNeedle.zRotation = CGFloat(Double.pi / 4)
        timerNeedle.size = CGSize(width: 65, height: 65)
        timerNeedle.position = CGPoint(x: self.frame.size.width / 1.150, y: self.frame.size.width / 2.3)
        self.addChild(timerNeedle)
        
        //BIN
        bin = SKSpriteNode(imageNamed: "Full_Container")
        bin.zPosition = 1
        bin.size = CGSize(width:(bin.size.width)*(self.size.width/bin.size.width)/(11.42/1.8),  height: bin.size.height * (self.size.height/bin.size.height)/(6.42/1.8))
        bin.position = CGPoint(x: self.frame.size.width / 1.140, y: self.frame.size.width / 5.5)
        self.addChild(bin)
        
        //BIN EMPTY
        binEmpty = SKSpriteNode(imageNamed: "Container_Empty")
        binEmpty.zPosition = 2
        binEmpty.isHidden = true
        binEmpty.size = CGSize(width: 120, height: 165)
        binEmpty.position = CGPoint(x: self.frame.size.width / 1.140, y: self.frame.size.width / 6.5)
        self.addChild(binEmpty)
        
        /// Title Label
        labelWin = SKLabelNode.init(text: "Congratulations")
        labelWin.name = "titleLabel-Inst"
        labelWin.fontName = "Avenir-Heavy"
        labelWin.horizontalAlignmentMode = .center
        labelWin.verticalAlignmentMode = .center
        labelWin.fontColor = .white
        labelWin.fontSize = 28
        labelWin.isHidden = true
        labelWin.zPosition = 3
        labelWin.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.width / 3)
        self.addChild(labelWin)
        
        /// Times Up
        labelTimesUp = SKLabelNode.init(text: "TIMES UP!!!")
        labelTimesUp.name = "titleLabel-Inst"
        labelTimesUp.fontName = "Avenir-Heavy"
        labelTimesUp.horizontalAlignmentMode = .center
        labelTimesUp.verticalAlignmentMode = .center
        labelTimesUp.fontColor = .white
        labelTimesUp.fontSize = 28
        labelTimesUp.isHidden = true
        labelTimesUp.zPosition = 3
        labelTimesUp.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.width / 3)
        self.addChild(labelTimesUp)
        
        //BIN EMPTY
        binEmpty = SKSpriteNode(imageNamed: "Container_Empty")
        binEmpty.zPosition = 2
        binEmpty.isHidden = true
        binEmpty.size = CGSize(width: 120, height: 165)
        binEmpty.position = CGPoint(x: self.frame.size.width / 1.140, y: self.frame.size.width / 6.5)
        self.addChild(binEmpty)
        
        
        //BIN EMPTY
        blackScreen = SKSpriteNode(imageNamed: "Black_Screen")
        blackScreen.zPosition = 4
        blackScreen.isHidden = true
        blackScreen.size = CGSize(width: 400, height: 310)
        blackScreen.position = CGPoint(x: self.frame.size.width / 2.6, y: self.frame.size.width / 3.5)
        self.addChild(blackScreen)
        
        //Happy Face
        happyFace = SKSpriteNode(imageNamed: "SmileyFace")
        happyFace.zPosition = 5
        happyFace.isHidden = true
        happyFace.size = CGSize(width: 430, height: 320)
        happyFace.position = CGPoint(x: self.frame.size.width / 2.6, y: self.frame.size.width / 3.5)
        self.addChild(happyFace)
        
        //Sad Face
        sadFace = SKSpriteNode(imageNamed: "SadFace")
        sadFace.zPosition = 5
        sadFace.isHidden = true
        sadFace.size = CGSize(width: 430, height: 320)
        sadFace.position = CGPoint(x: self.frame.size.width / 2.6, y: self.frame.size.width / 3.5)
        self.addChild(sadFace)
        
        
        //TRIANGULETES
        triangle_blue = SKSpriteNode(imageNamed: "FIgure_Triangle_Blue")
        triangle_blue.name = "Container_Triangle_Blue"
        triangle_blue.zPosition = 6
        triangle_blue.size = CGSize(width: 30, height: 30)
        triangle_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
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
        triangle_dblue.zPosition = 6
        triangle_dblue.size = CGSize(width: 30, height: 30)
        triangle_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
        
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
        triangle_green.zPosition = 6
        triangle_green.size = CGSize(width: 30, height: 30)
        triangle_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
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
        triangle_red.zPosition = 6
        triangle_red.size = CGSize(width: 30, height: 30)
        triangle_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
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
        triangle_yellow.zPosition = 6
        triangle_yellow.size = CGSize(width: 30, height: 30)
        triangle_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
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
        star_blue.zPosition = 6
        star_blue.size = CGSize(width: 30, height: 30)
        star_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
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
        star_dblue.zPosition = 6
        star_dblue.size = CGSize(width: 30, height: 30)
        star_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
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
        star_green.zPosition = 6
        star_green.size = CGSize(width: 30, height: 30)
        star_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
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
        star_red.zPosition = 6
        star_red.size = CGSize(width: 30, height: 30)
        star_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
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
        star_yellow.zPosition = 6
        star_yellow.size = CGSize(width: 30, height: 30)
        star_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
        star_yellow.physicsBody = SKPhysicsBody(rectangleOf: star_yellow.frame.size)
        star_yellow.physicsBody?.affectedByGravity = false
        star_yellow.physicsBody?.isDynamic = false
        star_yellow.physicsBody?.categoryBitMask = ColliderType.star_yellow
        // triangle_blue.physicsBody!.collisionBitMask = 0
        star_yellow.physicsBody?.collisionBitMask = ColliderType.star_yellow_container
        star_yellow.physicsBody?.contactTestBitMask = ColliderType.star_yellow_container
        self.addChild(star_yellow)
        
        //SQUARES
        square_blue = SKSpriteNode(imageNamed: "FIgure_Square_Blue")
        square_blue.name = "Container_Square_Blue"
        square_blue.zPosition = 6
        square_blue.size = CGSize(width: 30, height: 30)
        square_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
        square_blue.physicsBody = SKPhysicsBody(rectangleOf: square_blue.frame.size)
        square_blue.physicsBody?.affectedByGravity = false
        square_blue.physicsBody?.isDynamic = false
        square_blue.physicsBody?.categoryBitMask = ColliderType.square_blue
        // triangle_blue.physicsBody!.collisionBitMask = 0
        square_blue.physicsBody?.collisionBitMask = ColliderType.square_blue_container
        square_blue.physicsBody?.contactTestBitMask = ColliderType.square_blue_container
        self.addChild(square_blue)
        
        
        square_dblue = SKSpriteNode(imageNamed: "FIgure_Square_DBlue")
        square_dblue.name = "Container_Square_DBlue"
        square_dblue.zPosition = 6
        square_dblue.size = CGSize(width: 30, height: 30)
        square_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
        square_dblue.physicsBody = SKPhysicsBody(rectangleOf: square_dblue.frame.size)
        square_dblue.physicsBody?.affectedByGravity = false
        square_dblue.physicsBody?.isDynamic = false
        square_dblue.physicsBody?.categoryBitMask = ColliderType.square_dblue
        // triangle_blue.physicsBody!.collisionBitMask = 0
        square_dblue.physicsBody?.collisionBitMask = ColliderType.square_dblue_container
        square_dblue.physicsBody?.contactTestBitMask = ColliderType.square_dblue_container
        self.addChild(square_dblue)
        
        square_green = SKSpriteNode(imageNamed: "FIgure_Square_Green")
        square_green.name = "Container_Square_Green"
        square_green.zPosition = 6
        square_green.size = CGSize(width: 30, height: 30)
        square_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
        square_green.physicsBody = SKPhysicsBody(rectangleOf: square_green.frame.size)
        square_green.physicsBody?.affectedByGravity = false
        square_green.physicsBody?.isDynamic = false
        square_green.physicsBody?.categoryBitMask = ColliderType.square_green
        // triangle_blue.physicsBody!.collisionBitMask = 0
        square_green.physicsBody?.collisionBitMask = ColliderType.square_green_container
        square_green.physicsBody?.contactTestBitMask = ColliderType.square_green_container
        self.addChild(square_green)
        
        square_red = SKSpriteNode(imageNamed: "FIgure_Square_Red")
        square_red.name = "Container_Square_Red"
        square_red.zPosition = 6
        square_red.size = CGSize(width: 30, height: 30)
        square_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
        square_red.physicsBody = SKPhysicsBody(rectangleOf: star_red.frame.size)
        square_red.physicsBody?.affectedByGravity = false
        square_red.physicsBody?.isDynamic = false
        square_red.physicsBody?.categoryBitMask = ColliderType.square_red
        // triangle_blue.physicsBody!.collisionBitMask = 0
        square_red.physicsBody?.collisionBitMask = ColliderType.square_red_container
        square_red.physicsBody?.contactTestBitMask = ColliderType.square_red_container
        self.addChild(square_red)
        
        square_yellow = SKSpriteNode(imageNamed: "FIgure_Square_Yellow")
        square_yellow.name = "Container_Square_Yellow"
        square_yellow.zPosition = 6
        square_yellow.size = CGSize(width: 30, height: 30)
        square_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
        square_yellow.physicsBody = SKPhysicsBody(rectangleOf: star_yellow.frame.size)
        square_yellow.physicsBody?.affectedByGravity = false
        square_yellow.physicsBody?.isDynamic = false
        square_yellow.physicsBody?.categoryBitMask = ColliderType.square_yellow
        // triangle_blue.physicsBody!.collisionBitMask = 0
        square_yellow.physicsBody?.collisionBitMask = ColliderType.square_yellow_container
        square_yellow.physicsBody?.contactTestBitMask = ColliderType.square_yellow_container
        self.addChild(square_yellow)
        
        
        
        
        //HEXAGONES
        hexagone_blue = SKSpriteNode(imageNamed: "FIgure_Hexagone_Blue")
        hexagone_blue.name = "Container_Hexagone_Blue"
        hexagone_blue.zPosition = 6
        hexagone_blue.size = CGSize(width: 30, height: 30)
        hexagone_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
        hexagone_blue.physicsBody = SKPhysicsBody(rectangleOf: hexagone_blue.frame.size)
        hexagone_blue.physicsBody?.affectedByGravity = false
        hexagone_blue.physicsBody?.isDynamic = false
        hexagone_blue.physicsBody?.categoryBitMask = ColliderType.hexagone_blue
        // triangle_blue.physicsBody!.collisionBitMask = 0
        hexagone_blue.physicsBody?.collisionBitMask = ColliderType.hexagone_blue_container
        hexagone_blue.physicsBody?.contactTestBitMask = ColliderType.hexagone_blue_container
        self.addChild(hexagone_blue)
        
        hexagone_dblue = SKSpriteNode(imageNamed: "FIgure_Hexagone_DBlue")
        hexagone_dblue.name = "Container_Hexagone_DBlue"
        hexagone_dblue.zPosition = 6
        hexagone_dblue.size = CGSize(width: 30, height: 30)
        hexagone_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
        hexagone_dblue.physicsBody = SKPhysicsBody(rectangleOf: hexagone_dblue.frame.size)
        hexagone_dblue.physicsBody?.affectedByGravity = false
        hexagone_dblue.physicsBody?.isDynamic = false
        hexagone_dblue.physicsBody?.categoryBitMask = ColliderType.hexagone_dblue
        // triangle_blue.physicsBody!.collisionBitMask = 0
        hexagone_dblue.physicsBody?.collisionBitMask = ColliderType.hexagone_dblue_container
        hexagone_dblue.physicsBody?.contactTestBitMask = ColliderType.hexagone_dblue_container
        self.addChild(hexagone_dblue)
        
        hexagone_green = SKSpriteNode(imageNamed: "FIgure_Hexagone_Green")
        hexagone_green.name = "Container_Hexagone_Green"
        hexagone_green.zPosition = 6
        hexagone_green.size = CGSize(width: 30, height: 30)
        hexagone_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
        hexagone_green.physicsBody = SKPhysicsBody(rectangleOf: hexagone_green.frame.size)
        hexagone_green.physicsBody?.affectedByGravity = false
        hexagone_green.physicsBody?.isDynamic = false
        hexagone_green.physicsBody?.categoryBitMask = ColliderType.hexagone_green
        // triangle_blue.physicsBody!.collisionBitMask = 0
        hexagone_green.physicsBody?.collisionBitMask = ColliderType.hexagone_green_container
        hexagone_green.physicsBody?.contactTestBitMask = ColliderType.hexagone_green_container
        self.addChild(hexagone_green)
        
        hexagone_red = SKSpriteNode(imageNamed: "FIgure_Hexagone_Red")
        hexagone_red.name = "Container_Hexagone_Red"
        hexagone_red.zPosition = 6
        hexagone_red.size = CGSize(width: 30, height: 30)
        hexagone_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
        hexagone_red.physicsBody = SKPhysicsBody(rectangleOf: hexagone_red.frame.size)
        hexagone_red.physicsBody?.affectedByGravity = false
        hexagone_red.physicsBody?.isDynamic = false
        hexagone_red.physicsBody?.categoryBitMask = ColliderType.hexagone_red
        // triangle_blue.physicsBody!.collisionBitMask = 0
        hexagone_red.physicsBody?.collisionBitMask = ColliderType.hexagone_red_container
        hexagone_red.physicsBody?.contactTestBitMask = ColliderType.hexagone_red_container
        self.addChild(hexagone_red)
        
        hexagone_yellow = SKSpriteNode(imageNamed: "FIgure_Hexagone_Yellow")
        hexagone_yellow.name = "Container_Hexagone_Yellow"
        hexagone_yellow.zPosition = 6
        hexagone_yellow.size = CGSize(width: 30, height: 30)
        hexagone_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
        hexagone_yellow.physicsBody = SKPhysicsBody(rectangleOf: hexagone_yellow.frame.size)
        hexagone_yellow.physicsBody?.affectedByGravity = false
        hexagone_yellow.physicsBody?.isDynamic = false
        hexagone_yellow.physicsBody?.categoryBitMask = ColliderType.hexagone_yellow
        // triangle_blue.physicsBody!.collisionBitMask = 0
        hexagone_yellow.physicsBody?.collisionBitMask = ColliderType.hexagone_yellow_container
        hexagone_yellow.physicsBody?.contactTestBitMask = ColliderType.hexagone_yellow_container
        self.addChild(hexagone_yellow)
        
        
        
        
        
        
        // CIRCLES
        circle_blue.name = "Container_Circle_Blue"
        circle_blue.texture = SKTexture(imageNamed: "FIgure_Circle_Blue")
        circle_blue.zPosition = 6
        circle_blue.size = CGSize(width: 30, height: 30)
        circle_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
        //PhysicBody for the square 1
        
        circle_blue.physicsBody = SKPhysicsBody(rectangleOf: circle_blue.frame.size)
        circle_blue.physicsBody?.affectedByGravity = false
        circle_blue.physicsBody?.isDynamic = false
        circle_blue.physicsBody?.categoryBitMask = ColliderType.circle_blue
        //   circle_blue.physicsBody!.collisionBitMask = 0
        circle_blue.physicsBody?.collisionBitMask = ColliderType.circle_blue_container
        circle_blue.physicsBody?.contactTestBitMask = ColliderType.circle_blue_container
        self.addChild(circle_blue)
        
        circle_dblue.name = "Container_Circle_DBlue"
        circle_dblue.texture = SKTexture(imageNamed: "FIgure_Circle_DBlue")
        circle_dblue.zPosition = 6
        //circle_dblue.anchorPoint.y = -0.7
        circle_dblue.size = CGSize(width: 30, height: 30)
        circle_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
        //PhysicBody for the square 1
        
        circle_dblue.physicsBody = SKPhysicsBody(rectangleOf: circle_dblue.frame.size)
        circle_dblue.physicsBody?.affectedByGravity = false
        circle_dblue.physicsBody?.isDynamic = false
        circle_dblue.physicsBody?.categoryBitMask = ColliderType.circle_dblue
        //        circle_blue.physicsBody!.collisionBitMask = 0
        circle_dblue.physicsBody?.collisionBitMask = ColliderType.circle_dblue_container
        circle_dblue.physicsBody?.contactTestBitMask = ColliderType.circle_dblue_container
        self.addChild(circle_dblue)
        
        circle_green.name = "Container_Circle_Green"
        circle_green.texture = SKTexture(imageNamed: "FIgure_Circle_Green")
        circle_green.zPosition = 6
        //circle_dblue.anchorPoint.y = -0.7
        circle_green.size = CGSize(width: 30, height: 30)
        circle_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
        //PhysicBody for the square 1
        
        circle_green.physicsBody = SKPhysicsBody(rectangleOf: circle_green.frame.size)
        circle_green.physicsBody?.affectedByGravity = false
        circle_green.physicsBody?.isDynamic = false
        circle_green.physicsBody?.categoryBitMask = ColliderType.circle_green
        //        circle_blue.physicsBody!.collisionBitMask = 0
        circle_green.physicsBody?.collisionBitMask = ColliderType.circle_green_container
        circle_green.physicsBody?.contactTestBitMask = ColliderType.circle_green_container
        self.addChild(circle_green)
        
        circle_red.name = "Container_Circle_Red"
        circle_red.texture = SKTexture(imageNamed: "FIgure_Circle_Red")
        circle_red.zPosition = 6
        //circle_dblue.anchorPoint.y = -0.7
        circle_red.size = CGSize(width: 30, height: 30)
        circle_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
        //PhysicBody for the square 1
        
        circle_red.physicsBody = SKPhysicsBody(rectangleOf: circle_red.frame.size)
        circle_red.physicsBody?.affectedByGravity = false
        circle_red.physicsBody?.isDynamic = false
        circle_red.physicsBody?.categoryBitMask = ColliderType.circle_red
        //        circle_blue.physicsBody!.collisionBitMask = 0
        circle_red.physicsBody?.collisionBitMask = ColliderType.circle_red_container
        circle_red.physicsBody?.contactTestBitMask = ColliderType.circle_red_container
        self.addChild(circle_red)
        
        circle_yellow.name = "Container_Circle_Yellow"
        circle_yellow.texture = SKTexture(imageNamed: "FIgure_Circle_Yellow")
        circle_yellow.zPosition = 6
        //circle_dblue.anchorPoint.y = -0.7
        circle_yellow.size = CGSize(width: 30, height: 30)
        circle_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
        //PhysicBody for the square 1
        
        circle_yellow.physicsBody = SKPhysicsBody(rectangleOf: circle_yellow.frame.size)
        circle_yellow.physicsBody?.affectedByGravity = false
        circle_yellow.physicsBody?.isDynamic = false
        circle_yellow.physicsBody?.categoryBitMask = ColliderType.circle_yellow
        //        circle_blue.physicsBody!.collisionBitMask = 0
        circle_yellow.physicsBody?.collisionBitMask = ColliderType.circle_yellow_container
        circle_yellow.physicsBody?.contactTestBitMask = ColliderType.circle_yellow_container
        self.addChild(circle_yellow)
        
        arraySprites.append(triangle_blue)
        arraySprites.append(triangle_dblue)
        arraySprites.append(triangle_green)
        arraySprites.append(triangle_red)
        arraySprites.append(triangle_yellow)
        arraySprites.append(star_blue)
        arraySprites.append(star_dblue)
        arraySprites.append(star_green)
        arraySprites.append(star_red)
        arraySprites.append(star_yellow)
        arraySprites.append(square_blue)
        arraySprites.append(square_dblue)
        arraySprites.append(square_green)
        arraySprites.append(square_red)
        arraySprites.append(square_yellow)
        arraySprites.append(hexagone_blue)
        arraySprites.append(hexagone_dblue)
        arraySprites.append(hexagone_green)
        arraySprites.append(hexagone_red)
        arraySprites.append(hexagone_yellow)
        arraySprites.append(circle_blue)
        arraySprites.append(circle_dblue)
        arraySprites.append(circle_green)
        arraySprites.append(circle_red)
        arraySprites.append(circle_yellow)
        triangle_blue.isHidden = true
        triangle_dblue.isHidden = true
        triangle_green.isHidden = true
        triangle_red.isHidden = true
        triangle_yellow.isHidden = true
        star_blue.isHidden = true
        star_dblue.isHidden = true
        star_green.isHidden = true
        star_red.isHidden = true
        star_yellow.isHidden = true
        square_blue.isHidden = true
        square_dblue.isHidden = true
        square_green.isHidden = true
        square_red.isHidden = true
        square_yellow.isHidden = true
        hexagone_blue.isHidden = true
        hexagone_dblue.isHidden = true
        hexagone_green.isHidden = true
        hexagone_red.isHidden = true
        hexagone_yellow.isHidden = true
        circle_blue.isHidden = true
        circle_dblue.isHidden = true
        circle_green.isHidden = true
        circle_red.isHidden = true
        circle_yellow.isHidden = true
        
        
        print("Holiiii", arraySprites)
        print(index)
        
        
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
        
        
        
        if contact.bodyA.node?.name == "Square"{
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        
        if contact.bodyA.node?.name == "Container_Hexagone_Green"{
            firstBodyHexa = contact.bodyA
            secondBodyHexa = contact.bodyB
        }else{
            firstBodyHexa = contact.bodyB
            secondBodyHexa = contact.bodyA
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
        
        figure_name_sqb = "Container_Square_Blue"
        figure_name_sqdb = "Container_Square_DBlue"
        figure_name_sqg = "Container_Square_Green"
        figure_name_sqr = "Container_Square_Red"
        figure_name_sqy = "Container_Square_Yellow"
        
        figure_name_hb = "Container_Hexagone_Blue"
        figure_name_hdb = "Container_Hexagone_DBlue"
        figure_name_hg = "Container_Hexagone_Green"
        figure_name_hr = "Container_Hexagone_Red"
        figure_name_hy = "Container_Hexagone_Yellow"
        
        figure_name_cb = "Container_Circle_Blue"
        figure_name_cdb = "Container_Circle_DBlue"
        figure_name_cg = "Container_Circle_Green"
        figure_name_cr = "Container_Circle_Red"
        figure_name_cy = "Container_Circle_Yellow"
        
        
        //        if firstBody.node?.name == "Container_Circle_Blue" && secondBody.node?.name == figure_name_cb {
        //            print("Contact detected")
        //            containerSprite[0].block.texture = SKTexture(imageNamed: "Circle_Blue_Filled")
        //            //print("Contact happened between square 1 and square 2")
        //            circle_blue.isHidden = true
        //            circle_blue.physicsBody = nil
        //
        //        }else{
        //
        //            circle_blue.position = CGPoint(x: self.frame.size.width / 1.380, y: self.frame.size.width / 2)
        //        }
        
        if firstBody.node?.name == "Container_Circle_Blue" && secondBody.node?.name == figure_name_cb {
            print("Contact detected")
            containerSprite[0].block.texture = SKTexture(imageNamed: "Circle_Blue_Filled")
            //print("Contact happened between square 1 and square 2")
            circle_blue.isHidden = true
            circle_blue.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            
            circle_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
        }
        
        
        if firstBody.node?.name == "Container_Circle_DBlue" && secondBody.node?.name == figure_name_cdb {
            print("Contact detected")
            containerSprite[5].block.texture = SKTexture(imageNamed: "Circle_DBlue_Filled")
            //print("Contact happened between square 1 and square 2")
            circle_dblue.isHidden = true
            circle_dblue.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            
            circle_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
        }
        
        
        
        
        if firstBody.node?.name == "Container_Circle_Green" && secondBody.node?.name == figure_name_cg {
            print("Contact detected")
            containerSprite[10].block.texture = SKTexture(imageNamed: "Circle_Green_Filled")
            //print("Contact happened between square 1 and square 2")
            circle_green.isHidden = true
            circle_green.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            
            circle_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
            
            
        }
        
        
        if firstBody.node?.name == "Container_Circle_Red" && secondBody.node?.name == figure_name_cr {
            print("Contact detected")
            containerSprite[15].block.texture = SKTexture(imageNamed: "Circle_Red_Filled")
            //print("Contact happened between square 1 and square 2")
            circle_red.isHidden = true
            circle_red.physicsBody = nil
            arraySprites.remove(at: index)
            
            
        }else{
            
            circle_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
            
            
        }
        
        
        if firstBody.node?.name == "Container_Circle_Yellow" && secondBody.node?.name == figure_name_cy {
            print("Contact detected")
            containerSprite[20].block.texture = SKTexture(imageNamed: "Circle_Yellow_Filled")
            //print("Contact happened between square 1 and square 2")
            circle_yellow.isHidden = true
            circle_yellow.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            
            circle_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
        }
        
        //TRIANGULETES
        if firstBody.node?.name == "Container_Triangle_Blue" && secondBody.node?.name == figure_name_tb {
            print("Contact detected")
            containerSprite[4].block.texture = SKTexture(imageNamed: "Triangle_Blue_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_blue.isHidden = true
            triangle_blue.physicsBody = nil
            arraySprites.remove(at: index)
            //print("Array", containerSprite[4].block.name)
            //print("Figura", square.name)
        }else{
            triangle_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
            //print("fIRST BODY", firstBody.node?.name)
            //print("eCOND Body", secondBody.node?.name)
        }
        
        if firstBody.node?.name == "Container_Triangle_DBlue" && secondBody.node?.name == figure_name_tdb {
            print("Contact detected")
            containerSprite[9].block.texture = SKTexture(imageNamed: "Triangle_DBlue_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_dblue.isHidden = true
            triangle_dblue.physicsBody = nil
            arraySprites.remove(at: index)
            //print("Array", containerSprite[4].block.name)
            // print("Figura", square.name)
        }else{
            triangle_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
            // print("fIRST BODY", firstBody.node?.name)
            //print("eCOND Body", secondBody.node?.name)
        }
        
        if firstBody.node?.name == "Container_Triangle_Green" && secondBody.node?.name == figure_name_tg {
            print("Contact detected")
            containerSprite[14].block.texture = SKTexture(imageNamed: "Triangle_Green_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_green.isHidden = true
            triangle_green.physicsBody = nil
            arraySprites.remove(at: index)
            //            print("Array", containerSprite[14].block.name)
            //            print("Figura", triangle_green.name)
        }else{
            triangle_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
            // print("fIRST BODY", firstBody.node?.name)
            // print("eCOND Body", secondBody.node?.name)
        }
        
        if firstBody.node?.name == "Container_Triangle_Red" && secondBody.node?.name == figure_name_tr {
            print("Contact detected")
            containerSprite[19].block.texture = SKTexture(imageNamed: "Triangle_Red_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_red.isHidden = true
            triangle_red.physicsBody = nil
            arraySprites.remove(at: index)
            //print("Array", containerSprite[4].block.name)
            // print("Figura", square.name)
        }else{
            triangle_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
            // print("fIRST BODY", firstBody.node?.name)
            // print("eCOND Body", secondBody.node?.name)
        }
        
        if firstBody.node?.name == "Container_Triangle_Yellow" && secondBody.node?.name == figure_name_ty {
            print("Contact detected")
            containerSprite[24].block.texture = SKTexture(imageNamed: "Triangle_Yellow_Filled")
            //print("Contact happened between square 1 and square 2")
            triangle_yellow.isHidden = true
            triangle_yellow.physicsBody = nil
            arraySprites.remove(at: index)
            //print("Array", containerSprite[4].block.name)
            // print("Figura", square.name)
        }else{
            triangle_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
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
            arraySprites.remove(at: index)
            
        }else{
            star_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
        }
        
        if firstBody.node?.name == "Container_Star_DBlue" && secondBody.node?.name == figure_name_sdb {
            print("Contact detected")
            containerSprite[8].block.texture = SKTexture(imageNamed: "Star_DBlue_Filled")
            //print("Contact happened between square 1 and square 2")
            star_dblue.isHidden = true
            star_dblue.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            star_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
        }
        
        if firstBody.node?.name == "Container_Star_Green" && secondBody.node?.name == figure_name_sg {
            print("Contact detected")
            containerSprite[13].block.texture = SKTexture(imageNamed: "Star_Green_Filled")
            //print("Contact happened between square 1 and square 2")
            star_green.isHidden = true
            star_green.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            star_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
        }
        
        if firstBody.node?.name == "Container_Star_Red" && secondBody.node?.name == figure_name_sr {
            print("Contact detected")
            containerSprite[18].block.texture = SKTexture(imageNamed: "Star_Red_Filled")
            //print("Contact happened between square 1 and square 2")
            star_red.isHidden = true
            star_red.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            star_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
        }
        
        if firstBody.node?.name == "Container_Star_Yellow" && secondBody.node?.name == figure_name_sy {
            print("Contact detected")
            containerSprite[23].block.texture = SKTexture(imageNamed: "Star_Yellow_Filled")
            //print("Contact happened between square 1 and square 2")
            star_yellow.isHidden = true
            star_yellow.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            star_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
            
        }
        
        
        
        
        
        
        
        //SQUARES
        if firstBody.node?.name == "Container_Square_Blue" && secondBody.node?.name == figure_name_sqb {
            print("Contact detected")
            containerSprite[2].block.texture = SKTexture(imageNamed: "Square_Blue_Filled")
            //print("Contact happened between square 1 and square 2")
            square_blue.isHidden = true
            square_blue.physicsBody = nil
            arraySprites.remove(at: index)
        }else{
            square_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
        }
        
        if firstBody.node?.name == "Container_Square_DBlue" && secondBody.node?.name == figure_name_sqdb {
            print("Contact detected")
            containerSprite[7].block.texture = SKTexture(imageNamed: "Square_DBlue_Filled")
            //print("Contact happened between square 1 and square 2")
            square_dblue.isHidden = true
            square_dblue.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            square_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
            
        }
        
        if firstBody.node?.name == "Container_Square_Green" && secondBody.node?.name == figure_name_sqg {
            print("Contact detected")
            containerSprite[12].block.texture = SKTexture(imageNamed: "Square_Green_Filled")
            //print("Contact happened between square 1 and square 2")
            square_green.isHidden = true
            square_green.physicsBody = nil
            arraySprites.remove(at: index)
        }else{
            square_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
            
        }
        
        if firstBody.node?.name == "Container_Square_Red" && secondBody.node?.name == figure_name_sqr {
            print("Contact detected")
            containerSprite[17].block.texture = SKTexture(imageNamed: "Square_Red_Filled")
            //print("Contact happened between square 1 and square 2")
            square_red.isHidden = true
            square_red.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            square_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
            
        }
        
        if firstBody.node?.name == "Container_Square_Yellow" && secondBody.node?.name == figure_name_sqy {
            print("Contact detected")
            containerSprite[22].block.texture = SKTexture(imageNamed: "Square_Yellow_Filled")
            //print("Contact happened between square 1 and square 2")
            square_yellow.isHidden = true
            square_yellow.physicsBody = nil
            arraySprites.remove(at: index)
        }else{
            square_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
        }
        
        
        //HEXAGONES
        if firstBody.node?.name == "Container_Hexagone_Blue" && secondBody.node?.name == figure_name_hb {
            print("Contact detected")
            containerSprite[1].block.texture = SKTexture(imageNamed: "Hexagone_Blue_Filled")
            //print("Contact happened between square 1 and square 2")
            hexagone_blue.isHidden = true
            hexagone_blue.physicsBody = nil
            arraySprites.remove(at: index)
        }else{
            hexagone_blue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2)
        }
        
        if firstBody.node?.name == "Container_Hexagone_DBlue" && secondBody.node?.name == figure_name_hdb {
            print("Contact detected")
            containerSprite[6].block.texture = SKTexture(imageNamed: "Hexagone_DBlue_Filled")
            //print("Contact happened between square 1 and square 2")
            hexagone_dblue.isHidden = true
            hexagone_dblue.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            hexagone_dblue.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 2.4)
            
        }
        
        if firstBodyHexa.node?.name == "Container_Hexagone_Green" && secondBodyHexa.node?.name == figure_name_hg {
            print("Contact detected")
            containerSprite[11].block.texture = SKTexture(imageNamed: "Hexagone_Green_Filled")
            //print("Contact happened between square 1 and square 2")
            hexagone_green.isHidden = true
            hexagone_green.physicsBody = nil
            arraySprites.remove(at: index)
        }else{
            hexagone_green.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 3)
            
        }
        
        if firstBody.node?.name == "Container_Hexagone_Red" && secondBody.node?.name == figure_name_hr {
            print("Contact detected")
            containerSprite[16].block.texture = SKTexture(imageNamed: "Hexagone_Red_Filled")
            //print("Contact happened between square 1 and square 2")
            hexagone_red.isHidden = true
            hexagone_red.physicsBody = nil
            arraySprites.remove(at: index)
            
        }else{
            hexagone_red.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 4)
            
        }
        
        if firstBody.node?.name == "Container_Hexagone_Yellow" && secondBody.node?.name == figure_name_hy {
            print("Contact detected")
            containerSprite[21].block.texture = SKTexture(imageNamed: "Hexagone_Yellow_Filled")
            //print("Contact happened between square 1 and square 2")
            hexagone_yellow.isHidden = true
            hexagone_yellow.physicsBody = nil
            arraySprites.remove(at: index)
        }else{
            hexagone_yellow.position = CGPoint(x: self.frame.size.width / -4, y: self.frame.size.width / 6)
        }
        
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Antiguo array", arraySprites.count)
        myRandomItem = arraySprites.chooseOne
        index = arraySprites.index(of: myRandomItem)!
        
        print("INDEX INICIAL", index)
        
        
        //        for touch in touches{
        //            let location = touch.location(in: self)
        //
        ////            guard location.x > self.frame.size.width/1.250 else {
        ////                return
        ////            }
        ////
        ////            guard location.y < self.frame.size.height / 2.3  else {
        ////                return
        ////            }
        //
        //
        //
        //        }
        
        
        
        for touch in touches {
            let location = touch.location(in: self)
            if timerNeedle.frame.contains(location) {
                print("Start Game")
                if clicked == false {
                    startGame()
                }
                clicked = true
                
                start = true
            }
        }
        if start == true{
            for touch in touches {
                let location = touch.location(in: self)
                if bin.frame.contains(location) {
                    print("Bin touched")
                    
                    myRandomItem.frame.contains(location)
                    myRandomItem.position.x = location.x
                    myRandomItem.position.y = location.y
                    myRandomItem.isHidden = false
                    
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if circle_blue.frame.contains(location) {
                            circle_blue.position = location
                            circle_blue.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnCircleBlue = true
                            print("Blue Circle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            circle_blue.run(action, completion: {})
                            
                        }
                    }
                    
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if circle_dblue.frame.contains(location) {
                            circle_dblue.position = location
                            circle_dblue.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnCircleDBlue = true
                            print("Deep Blue Circle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            circle_dblue.run(action, completion: {})
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if circle_green.frame.contains(location) {
                            circle_green.position = location
                            circle_green.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnCircleGreen = true
                            print("Green Circle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            circle_green.run(action, completion: {})
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if circle_red.frame.contains(location) {
                            circle_red.position = location
                            circle_red.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnCircleRed = true
                            print("Red Circle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            circle_red.run(action, completion: {})
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if circle_yellow.frame.contains(location) {
                            circle_yellow.position = location
                            circle_yellow.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnCircleYellow = true
                            print("Yellow Circle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            circle_yellow.run(action, completion: {})
                            
                        }
                    }
                    
                    
                    
                    
                    //TRIANGULETES
                    for touch in touches {
                        let location = touch.location(in: self)
                        if triangle_blue.frame.contains(location) {
                            triangle_blue.position = location
                            triangle_blue.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnTriangleBlue = true
                            print("Blue triangle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            triangle_blue.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if triangle_dblue.frame.contains(location) {
                            triangle_dblue.position = location
                            triangle_dblue.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnTriangleDBlue = true
                            print("Deep blue triangle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            triangle_dblue.run(action, completion: {})
                        }
                    }
                    
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if triangle_green.frame.contains(location) {
                            triangle_green.position = location
                            triangle_green.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnTriangleGreen = true
                            print("Green triangle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            triangle_green.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if triangle_red.frame.contains(location) {
                            triangle_red.position = location
                            triangle_red.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnTriangleRed = true
                            print("Red triangle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            triangle_red.run(action, completion: {})
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if triangle_yellow.frame.contains(location) {
                            triangle_yellow.position = location
                            triangle_yellow.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnTriangleYellow = true
                            print("Yellow triangle")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            triangle_yellow.run(action, completion: {})
                            
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
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            star_blue.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if star_dblue.frame.contains(location) {
                            star_dblue.position = location
                            star_dblue.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnStarDBlue = true
                            print("Deep blue Star")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            star_dblue.run(action, completion: {})
                            
                        }
                    }
                    
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if star_green.frame.contains(location) {
                            star_green.position = location
                            star_green.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnStarGreen = true
                            print("Green Star")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            star_green.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if star_red.frame.contains(location) {
                            star_red.position = location
                            star_red.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnStarRed = true
                            print("Red Star")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            star_red.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if star_yellow.frame.contains(location) {
                            star_yellow.position = location
                            star_yellow.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnStarYellow = true
                            print("Yellow Star")
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            star_yellow.run(action, completion: {})
                            
                        }
                    }
                    
                    
                    //SQUARES
                    for touch in touches {
                        let location = touch.location(in: self)
                        if square_blue.frame.contains(location) {
                            square_blue.position = location
                            square_blue.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnSquareBlue = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            square_blue.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if square_dblue.frame.contains(location) {
                            square_dblue.position = location
                            square_dblue.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnSquareDBlue = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            square_dblue.run(action, completion: {})
                            
                            
                        }
                    }
                    
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if square_green.frame.contains(location) {
                            square_green.position = location
                            square_green.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnSquareGreen = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            square_green.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if square_red.frame.contains(location) {
                            square_red.position = location
                            square_red.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnSquareRed = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            square_red.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if square_yellow.frame.contains(location) {
                            square_yellow.position = location
                            square_yellow.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnSquareYellow = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            square_yellow.run(action, completion: {})
                            
                        }
                    }
                    
                    
                    
                    
                    //HEXAGONES
                    for touch in touches {
                        let location = touch.location(in: self)
                        if hexagone_blue.frame.contains(location) {
                            hexagone_blue.position = location
                            hexagone_blue.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnHexagoneBlue = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            hexagone_blue.run(action, completion: {})
                            
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if hexagone_dblue.frame.contains(location) {
                            hexagone_dblue.position = location
                            hexagone_dblue.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnHexagoneDBlue = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            hexagone_dblue.run(action, completion: {})
                            
                        }
                    }
                    
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if hexagone_green.frame.contains(location) {
                            hexagone_green.position = location
                            hexagone_green.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnHexagoneGreen = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            hexagone_green.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if hexagone_red.frame.contains(location) {
                            hexagone_red.position = location
                            hexagone_red.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnHexagoneRed = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            hexagone_red.run(action, completion: {})
                            
                        }
                    }
                    
                    for touch in touches {
                        let location = touch.location(in: self)
                        if hexagone_yellow.frame.contains(location) {
                            hexagone_yellow.position = location
                            hexagone_yellow.run(blinkAnimation(), withKey:"wiggle")
                            isFingerOnHexagoneYellow = true
                            
                            let action = SKAction.moveBy(x: 0, y: 40, duration: 0.2)
                            hexagone_yellow.run(action, completion: {})
                            
                        }
                    }
                    
                    
                    
                    
                }
                
            }
        }
        
        
        
        
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isFingerOnCircleBlue {
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var circleBlueX = circle_blue.position.x + (touchLocation.x - previousLocation.x)
            var circleBlueY = circle_blue.position.y + (touchLocation.y - previousLocation.y)
            
            circleBlueX = max(circleBlueX, circle_blue.size.width/2)
            circleBlueX = min(circleBlueX, size.width - circle_blue.size.width/2)
            
            circleBlueY = max(circleBlueY, circle_blue.size.width/2)
            circleBlueY = min(circleBlueY, size.width - circle_blue.size.width/2)
            
            circle_blue.position = CGPoint(x: circleBlueX, y: circleBlueY)
        }
        
        if isFingerOnCircleDBlue{
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var circleDblueX = circle_dblue.position.x + (touchLocation.x - previousLocation.x)
            var circleDblueY = circle_dblue.position.y + (touchLocation.y - previousLocation.y)
            
            circleDblueX = max(circleDblueX, circle_dblue.size.width/2)
            circleDblueX = min(circleDblueX, size.width - circle_dblue.size.width/2)
            
            circleDblueY = max(circleDblueY, circle_dblue.size.width/2)
            circleDblueY = min(circleDblueY, size.width - circle_dblue.size.width/2)
            
            
            circle_dblue.position = CGPoint(x: circleDblueX, y: circleDblueY)
        }
        
        if isFingerOnCircleGreen{
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var circleGreenX = circle_green.position.x + (touchLocation.x - previousLocation.x)
            var circleGreenY = circle_green.position.y + (touchLocation.y - previousLocation.y)
            
            circleGreenX = max(circleGreenX, circle_green.size.width/2)
            circleGreenX = min(circleGreenX, size.width - circle_green.size.width/2)
            
            circleGreenY = max(circleGreenY, circle_green.size.width/2)
            circleGreenY = min(circleGreenY, size.width - circle_green.size.width/2)
            
            
            circle_green.position = CGPoint(x: circleGreenX, y: circleGreenY)
        }
        
        if isFingerOnCircleRed{
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var circleRedX = circle_red.position.x + (touchLocation.x - previousLocation.x)
            var circleRedY = circle_red.position.y + (touchLocation.y - previousLocation.y)
            
            circleRedX = max(circleRedX, circle_red.size.width/2)
            circleRedX = min(circleRedX, size.width - circle_red.size.width/2)
            
            circleRedY = max(circleRedY, circle_red.size.width/2)
            circleRedY = min(circleRedY, size.width - circle_red.size.width/2)
            
            
            circle_red.position = CGPoint(x: circleRedX, y: circleRedY)
        }
        
        if isFingerOnCircleYellow{
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var circleYellowX = circle_yellow.position.x + (touchLocation.x - previousLocation.x)
            var circleYellowY = circle_yellow.position.y + (touchLocation.y - previousLocation.y)
            
            circleYellowX = max(circleYellowX, circle_yellow.size.width/2)
            circleYellowX = min(circleYellowX, size.width - circle_yellow.size.width/2)
            
            circleYellowY = max(circleYellowY, circle_yellow.size.width/2)
            circleYellowY = min(circleYellowY, size.width - circle_yellow.size.width/2)
            
            
            circle_yellow.position = CGPoint(x: circleYellowX, y: circleYellowY)
        }
        
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
        
        
        
        //SQUARES
        if isFingerOnSquareBlue {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = square_blue.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = square_blue.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, square_blue.size.width/2)
            paddleX = min(paddleX, size.width - square_blue.size.width/2)
            
            paddleY = max(paddleY, square_blue.size.width/2)
            paddleY = min(paddleY, size.width - square_blue.size.width/2)
            
            square_blue.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
        if isFingerOnSquareDBlue {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = square_dblue.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = square_dblue.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, square_dblue.size.width/2)
            paddleX = min(paddleX, size.width - square_dblue.size.width/2)
            
            paddleY = max(paddleY, square_dblue.size.width/2)
            paddleY = min(paddleY, size.width - square_dblue.size.width/2)
            
            square_dblue.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        if isFingerOnSquareGreen {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = square_green.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = square_green.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, square_green.size.width/2)
            paddleX = min(paddleX, size.width - square_green.size.width/2)
            
            paddleY = max(paddleY, square_green.size.width/2)
            paddleY = min(paddleY, size.width - square_green.size.width/2)
            
            square_green.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        if isFingerOnSquareRed {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = square_red.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = square_red.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, square_red.size.width/2)
            paddleX = min(paddleX, size.width - square_red.size.width/2)
            
            paddleY = max(paddleY, square_red.size.width/2)
            paddleY = min(paddleY, size.width - square_red.size.width/2)
            
            square_red.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
        if isFingerOnSquareYellow {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = square_yellow.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = square_yellow.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, square_yellow.size.width/2)
            paddleX = min(paddleX, size.width - square_yellow.size.width/2)
            
            paddleY = max(paddleY, square_yellow.size.width/2)
            paddleY = min(paddleY, size.width - square_yellow.size.width/2)
            
            square_yellow.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
        
        
        
        
        
        
        //HEXAGONES
        if isFingerOnHexagoneBlue {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = hexagone_blue.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = hexagone_blue.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, hexagone_blue.size.width/2)
            paddleX = min(paddleX, size.width - hexagone_blue.size.width/2)
            
            paddleY = max(paddleY, hexagone_blue.size.width/2)
            paddleY = min(paddleY, size.width - hexagone_blue.size.width/2)
            
            hexagone_blue.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
        if isFingerOnHexagoneDBlue {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = hexagone_dblue.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = hexagone_dblue.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, hexagone_dblue.size.width/2)
            paddleX = min(paddleX, size.width - hexagone_dblue.size.width/2)
            
            paddleY = max(paddleY, hexagone_dblue.size.width/2)
            paddleY = min(paddleY, size.width - hexagone_dblue.size.width/2)
            
            hexagone_dblue.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        if isFingerOnHexagoneGreen {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = hexagone_green.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = hexagone_green.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, hexagone_green.size.width/2)
            paddleX = min(paddleX, size.width - hexagone_green.size.width/2)
            
            paddleY = max(paddleY, hexagone_green.size.width/2)
            paddleY = min(paddleY, size.width - hexagone_green.size.width/2)
            
            hexagone_green.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        if isFingerOnHexagoneRed {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = hexagone_red.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = hexagone_red.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, hexagone_red.size.width/2)
            paddleX = min(paddleX, size.width - hexagone_red.size.width/2)
            
            paddleY = max(paddleY, hexagone_red.size.width/2)
            paddleY = min(paddleY, size.width - hexagone_red.size.width/2)
            
            hexagone_red.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
        if isFingerOnHexagoneYellow {
            
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            var paddleX = hexagone_yellow.position.x + (touchLocation.x - previousLocation.x)
            var paddleY = hexagone_yellow.position.y + (touchLocation.y - previousLocation.y)
            
            paddleX = max(paddleX, hexagone_yellow.size.width/2)
            paddleX = min(paddleX, size.width - hexagone_yellow.size.width/2)
            
            paddleY = max(paddleY, hexagone_yellow.size.width/2)
            paddleY = min(paddleY, size.width - hexagone_yellow.size.width/2)
            
            hexagone_yellow.position = CGPoint(x: paddleX, y: paddleY)
            
        }
        
        
    }
    func blinkAnimation() -> SKAction{
        let duration = 0.2
        let fadeOut = SKAction.rotate(toAngle: 0.09, duration: duration)
        let fadeIn = SKAction.rotate(toAngle: -0.09, duration: duration)
        let blink = SKAction.sequence([fadeOut, fadeIn])
        
        return SKAction.repeatForever(blink)
    }
    
    func startGame(){
        
        let action = SKAction.rotate(byAngle: -6.3, duration: 75)
        timerNeedle.run(action, completion: {
            print("Se acabo el tiempo")
            self.start = false
            //            self.sadFace.isHidden = false
            //            self.blackScreen.isHidden = false
            //TRANSITION
            let transition = SKTransition.fade(with: UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0), duration: 0.2)
            
            let gameOver = SKScene(fileNamed: "GameOverScene") as! SKScene
            
            
            self.view!.presentScene(gameOver, transition: transition)
            
            
            
        })
    }
    
    
    
    func Win(){
        if circle_blue.isHidden && circle_dblue.isHidden && circle_green.isHidden && circle_red.isHidden && circle_yellow.isHidden
            && hexagone_blue.isHidden && hexagone_dblue.isHidden && hexagone_green.isHidden && hexagone_red.isHidden && hexagone_yellow.isHidden
            && square_blue.isHidden && square_dblue.isHidden && square_green.isHidden && square_red.isHidden && square_yellow.isHidden
            && star_blue.isHidden && star_dblue.isHidden && star_green.isHidden && star_red.isHidden && star_yellow.isHidden
            && triangle_blue.isHidden && triangle_dblue.isHidden && triangle_green.isHidden && triangle_red.isHidden && triangle_yellow.isHidden {
            print("GANASTE")
            
            
        }else{
            print("PERDISTE")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        Checar()
        //Win()
        
        if arraySprites.count == 20{
            binEmpty.isHidden = false
            let transition = SKTransition.fade(with: UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0), duration: 0.2)
            
            let Winning = SKScene(fileNamed: "WinningScene") as! SKScene
            
            
            self.view!.presentScene(Winning, transition: transition)
        }
        
        print("INDEX FINAL", index)
        print("Nuevo Array", arraySprites.count)
        
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
        
        isFingerOnSquareBlue = false
        isFingerOnSquareDBlue = false
        isFingerOnSquareGreen = false
        isFingerOnSquareRed = false
        isFingerOnSquareYellow = false
        
        isFingerOnHexagoneBlue = false
        isFingerOnHexagoneDBlue = false
        isFingerOnHexagoneGreen = false
        isFingerOnHexagoneRed = false
        isFingerOnHexagoneYellow = false
        
        
        isFingerOnCircleBlue = false
        isFingerOnCircleDBlue = false
        isFingerOnCircleGreen = false
        isFingerOnCircleRed = false
        isFingerOnCircleYellow = false
        
        circle_blue.removeAction(forKey: "wiggle")
        circle_blue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        circle_dblue.removeAction(forKey: "wiggle")
        circle_dblue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        circle_green.removeAction(forKey: "wiggle")
        circle_green.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        circle_red.removeAction(forKey: "wiggle")
        circle_red.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        circle_yellow.removeAction(forKey: "wiggle")
        circle_yellow.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        
        
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
        
        
        square_blue.removeAction(forKey: "wiggle")
        square_blue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        square_dblue.removeAction(forKey: "wiggle")
        square_dblue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        square_green.removeAction(forKey: "wiggle")
        square_green.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        square_red.removeAction(forKey: "wiggle")
        square_red.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        square_yellow.removeAction(forKey: "wiggle")
        square_yellow.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        
        
        hexagone_blue.removeAction(forKey: "wiggle")
        hexagone_blue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        hexagone_dblue.removeAction(forKey: "wiggle")
        hexagone_dblue.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        hexagone_green.removeAction(forKey: "wiggle")
        hexagone_green.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        hexagone_red.removeAction(forKey: "wiggle")
        hexagone_red.run(SKAction.rotate(toAngle: 0, duration: 0.2))
        
        hexagone_yellow.removeAction(forKey: "wiggle")
        hexagone_yellow.run(SKAction.rotate(toAngle: 0, duration: 0.2))
    }
    
    
    
}
