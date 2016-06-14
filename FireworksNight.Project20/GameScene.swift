//
//  GameScene.swift
//  FireworksNight.Project20
//
//  Created by User on 6/12/16.
//  Copyright (c) 2016 Elijah Buters. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gameTimer: NSTimer!
    var fireworks = [SKNode]()
    
    let leftEdge = -22
    let bottomEdge = -22
    let rightEdge = 1024 + 22
    
    var score: Int = 0 {
        didSet {
            //
        }
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .Replace
        background.zPosition = -1
        addChild(background)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func createFirework(xMovement xMovement: CGFloat, x: Int, y: Int) {
        
        let node = SKNode()
        node.position = CGPoint(x: x, y: y)
        
        let firework = SKSpriteNode(imageNamed: "rocket")
        firework.name = "firework"
        node.addChild(firework)
        
        switch GKRandomSource.sharedRandom().nextIntWithUpperBound(3) {
        case 0:
            firework.color = UIColor.cyanColor()
            firework.colorBlendFactor = 1
        case 1:
            firework.color = UIColor.greenColor()
            firework.colorBlendFactor = 1
        case 2:
            firework.color = UIColor.redColor()
            firework.colorBlendFactor = 1
        default:
            break
        }
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: xMovement, y: 1000))
        
        let move = SKAction.followPath(path.CGPath, asOffset: true, orientToPath: true, speed: 200)
        node.runAction(move)
        
        let emitter = SKEmitterNode(fileNamed: "fuse")!
        emitter.position = CGPoint(x: 0, y: -22)
        node.addChild(emitter)
        
        fireworks.append(node)
        addChild(node)
    }
}
