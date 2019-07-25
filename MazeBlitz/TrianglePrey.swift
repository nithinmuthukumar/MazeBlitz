//
//  TrianglePrey.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-25.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit
class TrianglePrey:Prey{
    
    
    var body:SKShapeNode!
    var worth=1;
    
    required init(_ x: CGFloat, _ y: CGFloat) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 5.0*3))
        path.addLine(to: CGPoint(x: 5*3, y: -3.66*3))
        path.addLine(to: CGPoint(x: -5*3, y: -3.66*3))
        path.addLine(to: CGPoint(x: 0.0, y: 5*3))
        body=SKShapeNode(path: path.cgPath)
    
        body.position.x=x
        body.position.y=y
        
        body.run(SKAction.repeatForever(SKAction.rotate(byAngle: 1, duration: 2)))
        body.fillColor=SKColor.white
        body.strokeColor=SKColor.black
    }
    
    
    
    
    func update(players: [Player]) {
    }
    
    
    

}
