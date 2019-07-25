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
    init(_ x:CGFloat, _ y:CGFloat)
}
