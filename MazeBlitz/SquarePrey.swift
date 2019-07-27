//
//  SquarePrey.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-25.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit
class SquarePrey:AI,Entity{
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var shape=Shape.Square
    var worth = 3
    var velocity=Vector2(0,0)
    var sightDistance:CGFloat=500
    
    
    
    var body: SKShapeNode!
    
    required init(_ x: CGFloat, _ y: CGFloat) {
        var dimensions=CGRect(x:0,y:0,width:20,height:20)
        body=SKShapeNode(rect: dimensions)
        body.position.x=x
        body.position.y=y
        body.fillColor=SKColor.white
        body.run(SKAction.rotate(byAngle: 1, duration: 1))
        
        
        body.physicsBody=SKPhysicsBody(polygonFrom: body.path!)
        body.name=shape.description

        
    }
    func update(_ prey: ArraySlice<Entity>, _ predator: ArraySlice<Entity>) {
        for p in predator{
            if p.shape==shape{
                continue
            }
            let v=Vector2(body.position,p.body.position)
            if(v.len()<sightDistance){
                
                velocity.sub(v.nor())
            }
            
        }
        if(velocity.len()==0){
            for p in prey{
                if p.shape==shape{
                    continue
                }
                let v=Vector2(body.position,p.body.position)
                if(v.len()<sightDistance){
                    
                    velocity.add(v.nor())
                }
            }
        }
        velocity.nor()
        body.position.x-=velocity.x
        body.position.y-=velocity.y
        
    }
    func eat(entity: Entity) {
        body.fillColor=SKColor.red
        
        
    }
    
}
