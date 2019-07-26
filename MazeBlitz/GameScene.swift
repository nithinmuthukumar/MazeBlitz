//
//  GameScene.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-19.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    var entities = [Entity]();
    var gameCam: SKCameraNode?
    var titleLabel: SKLabelNode?
    var player:Player!
    
    override func sceneDidLoad() {
        gameCam = childNode(withName: "camera") as? SKCameraNode
        titleLabel = childNode(withName: "title") as? SKLabelNode
        camera=gameCam
        for i in 0..<50{
            var trianglePrey=TrianglePrey(CGFloat.random(in: 0..<5000),CGFloat.random(in: 0..<5000))
            var squarePrey=SquarePrey(CGFloat.random(in: 0..<5000),CGFloat.random(in: 0..<5000))
            
            addChild(trianglePrey.body)
            addChild(squarePrey.body)
            entities.append(trianglePrey)
            entities.append(squarePrey)
        }
        physicsWorld.gravity=CGVector(dx:0,dy:0)
        
        
    }
    
    
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(player==nil){
            
            player=Player(CGFloat.random(in: 0..<5000),CGFloat.random(in: 0..<5000))
            addChild(player!.body)
            entities.append(player)
            gameCam?.run(SKAction.move(to: player.body.position, duration: 1))
            titleLabel?.run(SKAction.fadeOut(withDuration: 0.5))
        }
        
        
        player.touch(touches.first!.location(in: self))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(player.active){
            player.moveStick(touches.first!.location(in: self))
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.active=false
        
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        if(player == nil){
            return
        }
        entities.sort(by: {$0.shape.rawValue<$1.shape.rawValue})
        if(!gameCam!.hasActions()){
            camera!.position.x=player.body.position.x
            camera!.position.y=player.body.position.y
        }
        player.update()
        for p in 0..<entities.count{
            if let entity=entities[p] as? AI{
                entity.update(entities[0..<p],entities[p+1..<entities.count])
                
            }
        }
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        var nodeA=contact.bodyA.node!
        var nodeB=contact.bodyB.node!
        if(nodeA.name!=nil||nodeB.name!=nil){
            return
        }
        var shapeA=Shape.withLabel(nodeA.name)
        var shapeB=Shape.withLabel(nodeB.name)
        if(shapeA<shapeB){
            (nodeB as! Entity).eat(nodeA as! Entity)
        }else if(shapeB<shapeA){
            (nodeA as! Entity).eat(nodeB as! Entity)
            
        }
        
    }
    
}
