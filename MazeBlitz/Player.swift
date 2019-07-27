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
class Player:Entity{
    var shape=Shape.Circle
    
    

    
    
    var worth=100
    
    
    
    
    var body:SKShapeNode!
    var exp=0
    var expPerLevel=[5,10,20,50]
    
    var active: Bool=false{
        willSet{
            
            
            if(active){
                var node:SKShapeNode=body
                while(!node.children.isEmpty){
                    var nextNode=node.children.first as! SKShapeNode
                    nextNode.run(SKAction.move(to: CGPoint(x:0,y:0), duration: 1))
                    node=nextNode
                }
                
            }
        }
    }
    var velocity=Vector2(0,0)
    var speed:CGFloat=5

    required init(_ x:CGFloat,_ y:CGFloat){
        
        grow(8)
        grow(16)
        
        
        
        body.position.x=x
        body.position.y=y
        
        
    }
    func contains(_ p:CGPoint)->Bool{
        var point=p
        var node:SKShapeNode=body
        while(!node.children.isEmpty){
            
            if node.contains(point){
                return true;
            }
            node=node.children.first as! SKShapeNode
            point.x-=node.position.x
            point.y-=node.position.y
            
        }
        return false;
        
    }
    func eat(entity:Entity){
        exp+=entity.worth
        if(exp>expPerLevel[0]){
            grow(body.path!.boundingBox.width)
            expPerLevel.removeFirst()
        }
    }
    func createShape(_ size:CGFloat,_ sides:Int)->SKShapeNode{
        
        var polygon=SKShapeNode(circleOfRadius: size)
        polygon.physicsBody=SKPhysicsBody(polygonFrom: polygon.path!)
        polygon.name=shape.description
        return polygon
    }
    func grow(_ size:CGFloat){
        
        
        let root=createShape(size,0)
        
        if(body != nil){
            
            if let parent=body.parent{
                parent.addChild(root)
                
            }
            body.removeFromParent()
            root.addChild(body)
            root.position=body.position
            
        }
    
        root.fillColor=SKColor.white
        root.strokeColor=SKColor.black
        
        body=root
        
        
    
    }
    func update(){
        
        if(active){
            body.position.x-=velocity.x
            body.position.y-=velocity.y
        }else if(velocity.len()>0.5){
            body.position.x-=velocity.x
            body.position.y-=velocity.y
            velocity.scl(0.9)
            
        }
    }
    func touch(_ point:CGPoint){
        active=true
        
    }
    func moveStick(_ p:CGPoint){
        var point=p
        velocity.x=point.x-body.position.x
        velocity.y=point.y-body.position.y
        velocity.nor().scl(speed)
        var node:SKShapeNode=body
        while(!node.children.isEmpty){
            
            
            var nextNode=node.children.first as! SKShapeNode
            if(node.contains(point)){
                point.x-=node.position.x
                point.y-=node.position.y
                nextNode.position=point
            }else{
                
                point.x-=node.position.x
                point.y-=node.position.y
                
                let sz=nextNode.path!.boundingBox.width
                let nextPos=CGPoint(x:sz*cos(velocity.angle()),y:sz*sin(velocity.angle()))
                
                nextNode.run(SKAction.move(to: nextPos, duration: 0.1))
                
                
            }
            node=nextNode
            
            
            
            
            
        }
    
    }
    
    
    
}
