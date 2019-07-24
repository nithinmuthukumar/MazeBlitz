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
    func len()->CGFloat{
        return CGFloat.squareRoot(x * x + y * y)()
    }
    func nor(){
        let length=len()
        x/=length
        y/=length
    }
}
