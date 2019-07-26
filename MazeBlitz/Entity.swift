//
//  Entity.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-25.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit
protocol Entity {
    
    var body:SKShapeNode! {get}
    
    var shape:Shape {get}
    var velocity:Vector2 {get}
    var worth:Int { get }
    
    init(_ x:CGFloat, _ y:CGFloat)
    func eat(entity:Entity)
}
