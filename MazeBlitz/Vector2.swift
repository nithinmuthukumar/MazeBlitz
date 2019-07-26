//
//  Vector2.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-24.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit
class Vector2{
    var x:CGFloat
    var y:CGFloat
    init(_ x:Int,_ y:Int) {
        self.x=CGFloat(x)
        self.y=CGFloat(y)
    }
    init(_ p1:CGPoint, _ p2:CGPoint){
        self.x=p1.x-p2.x
        self.y=p1.y-p2.y
    }
    func len()->CGFloat{
        return CGFloat.squareRoot(x * x + y * y)()
    }
    func nor()->Vector2{
        
        let length=len()
        
        x/=length
        y/=length
        if(x.isNaN){
            x=0
            y=0
        }
        
        
        return self
    }
    func sub(_ v:Vector2)->Vector2{
        x-=v.x
        y-=v.y
        return self
        
    }
    func scl(_ factor:CGFloat)->Vector2{
        x*=factor
        y*=factor
        return self
    }
    func angle () ->CGFloat{
        return atan2(y, x)
    
    }
}
