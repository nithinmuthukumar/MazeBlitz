//
//  GameScene.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-19.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gameCam: SKCameraNode?
    var player:Player!
    
    override func sceneDidLoad() {
        
        gameCam = childNode(withName: "camera") as? SKCameraNode
        camera=gameCam
        
        
        
        
        
        

        
    }
    
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(player==nil){
            player=Player(CGFloat.random(in: 0..<1000),CGFloat.random(in: 0..<1000))
            addChild(player!.body)
            gameCam?.run(SKAction.move(to: player.body.position, duration: 1))
        }
        player.touch(touches.first!.location(in: self))
        
        
            
        
        
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(player.active){
            player.moveStick(touches.first!)
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.active=false
        
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        if(player != nil){
            if(!gameCam!.hasActions()){
                camera!.position.x=player.body.position.x
                camera!.position.y=player.body.position.y
            }
            player.update()
        }
        
    }
}
