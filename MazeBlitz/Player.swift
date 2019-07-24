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
    var speed=Vector2(1,0)
    
    var body=SKNode()
    init(_ x:CGFloat,_ y:CGFloat){
        let root=SKShapeNode(circleOfRadius: 100)
        root.fillColor=SKColor.white
        body.addChild(root)
        body.position.x=x
        body.position.y=y
    }
    func update(){
        body.position.x+=speed.x
        body.position.y+=speed.y
        
        
        
    }
    
}
