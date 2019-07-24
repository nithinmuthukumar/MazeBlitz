//
//  Player.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-24.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
class Player{
    var active=false
    var velocity=Vector2(0,0)
    var speed:CGFloat=5
    
    var body=SKNode()
    init(_ x:CGFloat,_ y:CGFloat){
        grow(128)
        grow(64)
        grow(32)
        grow(16)
        grow(8)
        
        
        body.position.x=x
        body.position.y=y
    }
    func grow(_ size:CGFloat){
        let root=SKShapeNode(circleOfRadius: size)
        root.fillColor=SKColor.white
        root.strokeColor=SKColor.black
        
        body.addChild(root)
        
        
    
    }
    func update(){
        
        if(active){
            body.position.x-=velocity.x
            body.position.y-=velocity.y
        }
        
        
        
    }
    func touch(_ point:CGPoint){
        if(body.contains(point)){
            active=true
            
        }
        
    }
    func moveStick(_ index:Int,_ newPos:CGPoint){
        
        if index-1 == -1{
            return
        }
        moveStick(index-1,newPos)
        if let parent=body.children[index-1] as? SKShapeNode,let node=body.children[index] as? SKShapeNode {
        
            
            
            
            if(parent.contains(newPos)){
                node.position=newPos
                
            }else{
                let sz=node.path!.boundingBox.width
                let nextPos=CGPoint(x:sz*cos(velocity.angle())+parent.position.x,y:sz*sin(velocity.angle())+parent.position.y)
                
                node.run(SKAction.move(to: nextPos, duration: 0.1))
            }
            
        }
    }
    func moveStick(_ touch:UITouch){
        let point=touch.location(in: body)
        velocity.x=point.x
        velocity.y=point.y
        velocity.nor().scl(speed)
        moveStick(body.children.count-1,point)

        
        
        
        
    }
    
}
